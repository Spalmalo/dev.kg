require 'rails_helper'

describe 'PUT /screencasts/:id' do
  subject { put "/screencasts/#{ screencast.to_param }", params; response }

  let!(:screencast) { create :screencast }
  let(:params) { {} }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when screencast belongs to current user" do
      let!(:screencast) { create :screencast, user: user }

      context "when valid params given" do
        let(:params) { { screencast: attributes_for(:screencast) } }

        it { is_expected.to redirect_to(screencast) }
      end

      context "when invalid params given" do
        let(:params) { { screencast: { title: "" } } }

        it { is_expected.to be_unprocessable }

        it { is_expected.to render_template 'edit' }
      end
    end

    context "when screencast belongs to other user" do
      it { is_expected.to be_forbidden }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end