require 'rails_helper'

describe 'POST /posts' do
  subject { post "/posts", params ; response }

  let(:params) { { post: attributes_for(:post) } }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when valid params given" do
      it { is_expected.to redirect_to Post.last }
    end

    context "when invalid params given" do
      let(:params) { { post: { wrong: "params" } } }

      it { is_expected.to be_unprocessable }

      it "should respond with post form" do
        expect(subject.body).to include I18n.t("pages.post_new")
      end
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end