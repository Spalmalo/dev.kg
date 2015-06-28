require 'rails_helper'

describe 'PUT /posts/:id' do
  subject { put "/posts/#{ post.to_param }", params; response }

  let!(:post) { create :post }
  let(:params) { {} }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when post belongs to current user" do
      let!(:post) { create :post, user: user }

      context "when valid params given" do
        let(:params) { { post: attributes_for(:post) } }

        it { is_expected.to redirect_to(post) }
      end

      context "when invalid params given" do
        let(:params) { { post: { title: "" } } }

        it { is_expected.to be_unprocessable }

        it { is_expected.to render_template 'edit' }
      end
    end

    context "when post belongs to other user" do
      it { is_expected.to be_forbidden }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end