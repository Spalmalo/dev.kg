require 'rails_helper'

describe Post, type: :model do
  describe ".published" do
    subject { described_class.published }

    let!(:published_videos)   { create_list :post, 2, published_at: Time.now }
    let!(:unpublished_videos) { create_list :post, 2, published_at: nil }

    it { is_expected.to be_an ActiveRecord::Relation }

    it "should return published videos" do
      expect(subject.to_set).to eq published_videos.to_set
    end

    it "should not include unpublished videos" do
      unpublished_videos.each do |video|
        expect(subject).not_to include video
      end
    end

  end
end