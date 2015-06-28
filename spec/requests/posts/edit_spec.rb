require 'rails_helper'

describe 'GET /posts/:id/edit' do
  subject { get "/posts/#{ post.to_param }/edit"; response }

  let!(:post) { create :post }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when post belongs to current user" do
      let!(:post) { create :post, user: user }

      it { is_expected.to be_successful }

      it { is_expected.to render_template 'edit' }
    end

    context "when post belongs to other user" do
      it { is_expected.to be_forbidden }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end