require 'rails_helper'

# TODO use shared examples
describe 'POST /clips/:id/like' do
  subject { post "/clips/#{ clip.to_param }/like"; response }

  let!(:clip) { create :clip }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when clip belongs to current user" do
      let!(:clip) { create :clip, user: user }

      it { is_expected.to redirect_to clip }
    end

    context "when clip belongs to other user" do
      it { is_expected.to redirect_to clip }
    end

    context "when clip has current user impression already" do
      before { Dislike.create user: user, video: clip }

      it { is_expected.to redirect_to clip }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end

describe 'POST /clips/:id/dislike' do
  subject { post "/clips/#{ clip.to_param }/dislike"; response }

  let!(:clip) { create :clip }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when clip belongs to current user" do
      let!(:clip) { create :clip, user: user }

      it { is_expected.to redirect_to clip }
    end

    context "when clip belongs to other user" do
      it { is_expected.to redirect_to clip }
    end

    context "when clip has current user impression already" do
      before { Dislike.create user: user, video: clip }

      it { is_expected.to redirect_to clip }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end