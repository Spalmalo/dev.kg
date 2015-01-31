require 'rails_helper'

describe ScreencastsController, type: :controller do
  describe "DELETE 'destroy'" do
    subject { delete :destroy, id: screencast.to_param }

    let!(:user) { create :user }
    before { login_as user }

    context "when screencast belongs to current user" do
      let!(:screencast) { create :screencast, user: user }

      it "should destroy screencast" do
        subject
        expect(Screencast.exists? screencast.id).to eq false
      end

    end

    context "when screencast belongs to other user" do
      let!(:screencast) { create :screencast }

      it "should not destroy any screencasts" do
        expect { subject }.not_to change(Screencast, :count)
      end

    end

  end
end