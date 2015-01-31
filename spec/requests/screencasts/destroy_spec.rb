require 'rails_helper'

describe 'DELETE /screencasts/:id' do
  subject { delete "/screencasts/#{ screencast.to_param }"; response }

  let!(:screencast) { create :screencast }

  context "when user is signed in" do
    let!(:user) { create :user }
    before { login_as user }

    context "when screencast belongs to current user" do
      let!(:screencast) { create :screencast, user: user }

      it { is_expected.to redirect_to :root }
    end

    context "when screencast belongs to other user" do
      it { is_expected.to be_forbidden }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end