require 'rails_helper'

describe 'GET /screencasts/new' do
  subject { get "/screencasts/new"; response }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    it { is_expected.to be_successful }

    it "should include new screencast form" do
      expect(subject.body).to include I18n.t("pages.screencast_new")
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end