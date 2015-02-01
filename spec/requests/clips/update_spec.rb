require 'rails_helper'

describe 'PUT /clips/:id' do
  subject { put "/clips/#{ clip.to_param }", params; response }

  let!(:clip) { create :clip }
  let(:params) { {} }

  context "when user is signed in" do
    let!(:user) { create :user }

    before { login_as user }

    context "when clip belongs to current user" do
      let!(:clip) { create :clip, user: user }

      context "when valid params given" do
        let(:params) { { clip: attributes_for(:clip) } }

        it { is_expected.to redirect_to(clip) }
      end

      context "when invalid params given" do
        let(:params) { { clip: { title: "" } } }

        it { is_expected.to be_unprocessable }

        it { is_expected.to render_template 'edit' }
      end
    end

    context "when clip belongs to other user" do
      it { is_expected.to be_forbidden }
    end

  end

  context "when user is not signed in" do

    it { is_expected.to redirect_to sign_in_path }

  end
end