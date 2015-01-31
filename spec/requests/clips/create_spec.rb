require 'rails_helper'

describe 'POST /clips' do
  subject { post "/clips", params ; response }

  let(:params) { { clip: attributes_for(:clip) } }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when valid params given" do
      it { is_expected.to redirect_to Clip.last }
    end

    context "when invalid params given" do
      let(:params) { { clip: { wrong: "params" } } }

      it { is_expected.to be_unprocessable }

      it "should respond with clip form" do
        expect(subject.body).to include I18n.t("pages.clip_new")
      end
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end