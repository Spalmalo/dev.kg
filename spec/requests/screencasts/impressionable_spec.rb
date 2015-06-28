require 'rails_helper'

# TODO use shared examples
describe 'POST /screencasts/:id/like' do
  subject { post "/screencasts/#{ screencast.to_param }/like"; response }

  let!(:screencast) { create :screencast }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when screencast belongs to current user" do
      let!(:screencast) { create :screencast, user: user }

      it { is_expected.to redirect_to screencast }
    end

    context "when screencast belongs to other user" do
      it { is_expected.to redirect_to screencast }
    end

    context "when screencast has current user impression already" do
      before { Dislike.create user: user, impressionable: screencast }

      it { is_expected.to redirect_to screencast }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end

describe 'POST /screencasts/:id/dislike' do
  subject { post "/screencasts/#{ screencast.to_param }/dislike"; response }

  let!(:screencast) { create :screencast }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when screencast belongs to current user" do
      let!(:screencast) { create :screencast, user: user }

      it { is_expected.to redirect_to screencast }
    end

    context "when screencast belongs to other user" do
      it { is_expected.to redirect_to screencast }
    end

    context "when screencast has current user impression already" do
      before { Dislike.create user: user, impressionable: screencast }

      it { is_expected.to redirect_to screencast }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end