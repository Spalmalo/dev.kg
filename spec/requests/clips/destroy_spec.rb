require 'rails_helper'

describe 'DELETE /clips/:id' do
  subject { delete "/clips/#{ clip.to_param }"; response }

  let!(:clip) { create :clip }

  context "when user is signed in" do
    let!(:user) { create :user }
    before { login_as user }

    context "when clip belongs to current user" do
      let!(:clip) { create :clip, user: user }

      it { is_expected.to redirect_to :clips }
    end

    context "when clip belongs to other user" do
      it { is_expected.to be_forbidden }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end