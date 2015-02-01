require 'rails_helper'

describe 'GET /screencasts/:id/edit' do
  subject { get "/screencasts/#{ screencast.to_param }/edit"; response }

  let!(:screencast) { create :screencast }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when screencast belongs to current user" do
      let!(:screencast) { create :screencast, user: user }

      it { is_expected.to be_successful }

      it { is_expected.to render_template 'edit' }
    end

    context "when screencast belongs to other user" do
      it { is_expected.to be_forbidden }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end