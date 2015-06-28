require 'rails_helper'

describe Post, type: :model do
  describe ".for_user" do
    subject { described_class.for_user user_scope }

    let!(:user) { create :user }

    let!(:published_posts)   { create_list :post, 2, published_at: Time.now }
    let!(:unpublished_posts) { create_list :post, 2, published_at: nil }
    let!(:unpublished_user_posts) { create_list :post, 2, published_at: nil, user: user }

    context "when user given" do
      let(:user_scope) { user }

      it { is_expected.to be_an ActiveRecord::Relation }

      it "should return published posts and user's unpublished post" do
        expected_posts_set = (published_posts + unpublished_user_posts).to_set
        expect(subject.to_set).to eq expected_posts_set
      end

      it "should not include unpublished posts of other users" do
        unpublished_posts.each do |post|
          expect(subject).not_to include post
        end
      end
    end

    context "when no user given" do
      let(:user_scope) { nil }

      it { is_expected.to be_an ActiveRecord::Relation }

      it "should return published posts" do
        expect(subject.to_set).to eq published_posts.to_set
      end

      it "should not include unpublished posts" do
        unexpected_posts = unpublished_posts + unpublished_user_posts
        unexpected_posts.each do |post|
          expect(subject).not_to include post
        end
      end
    end

  end
end