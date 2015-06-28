require 'rails_helper'

# TODO use shared examples
describe 'POST /posts/:id/like' do
  subject { post "/posts/#{ _post.to_param }/like"; response }

  let!(:_post) { create :post }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when post belongs to current user" do
      let!(:_post) { create :post, user: user }

      it { is_expected.to redirect_to _post }
    end

    context "when post belongs to other user" do
      it { is_expected.to redirect_to _post }
    end

    context "when post has current user impression already" do
      before { Dislike.create user: user, impressionable: _post }

      it { is_expected.to redirect_to _post }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end

describe 'POST /posts/:id/dislike' do
  subject { post "/posts/#{ _post.to_param }/dislike"; response }

  let!(:_post) { create :post }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when post belongs to current user" do
      let!(:_post) { create :post, user: user }

      it { is_expected.to redirect_to _post }
    end

    context "when post belongs to other user" do
      it { is_expected.to redirect_to _post }
    end

    context "when post has current user impression already" do
      before { Dislike.create user: user, impressionable: _post }

      it { is_expected.to redirect_to _post }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end