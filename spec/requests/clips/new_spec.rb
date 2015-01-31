require 'rails_helper'

describe 'GET /clips/new' do
  subject { get "/clips/new"; response }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    it { is_expected.to be_successful }

    it { is_expected.to render_template 'new' }
  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end