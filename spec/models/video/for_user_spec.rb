require 'rails_helper'

describe Video, type: :model do
  describe ".for_user" do
    subject { described_class.for_user user_scope }

    let!(:user) { create :user }

    let!(:published_videos)   { create_list :screencast, 2, published_at: Time.now }
    let!(:unpublished_videos) { create_list :screencast, 2, published_at: nil }
    let!(:unpublished_user_videos) { create_list :screencast, 2, published_at: nil, user: user }

    context "when user given" do
      let(:user_scope) { user }

      it { is_expected.to be_an ActiveRecord::Relation }

      it "should return published videos and user's unpublished video" do
        expected_videos_set = (published_videos + unpublished_user_videos).to_set
        expect(subject.to_set).to eq expected_videos_set
      end

      it "should not include unpublished videos of other users" do
        unpublished_videos.each do |video|
          expect(subject).not_to include video
        end
      end
    end

    context "when no user given" do
      let(:user_scope) { nil }

      it { is_expected.to be_an ActiveRecord::Relation }

      it "should return published videos" do
        expect(subject.to_set).to eq published_videos.to_set
      end

      it "should not include unpublished videos" do
        unexpected_videos = unpublished_videos + unpublished_user_videos
        unexpected_videos.each do |video|
          expect(subject).not_to include video
        end
      end
    end

  end
end