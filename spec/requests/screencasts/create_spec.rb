require 'rails_helper'

describe 'POST /screencasts' do
  subject { post "/screencasts", params ; response }

  let(:params) { { screencast: attributes_for(:screencast) } }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when valid params given" do
      it { is_expected.to redirect_to Screencast.last }
    end

    context "when invalid params given" do
      let(:params) { { screencast: { wrong: "params" } } }

      it { is_expected.to be_unprocessable }

      it "should respond with screencast form" do
        expect(subject.body).to include I18n.t("pages.screencast_new")
      end
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end