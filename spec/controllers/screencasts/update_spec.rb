require 'rails_helper'

describe ScreencastsController, type: :controller do
  describe "PUT 'update'" do
    subject { put :update, ({id: screencast.to_param}).merge(params) }

    let!(:user) { create :user }
    let!(:screencast) { create :screencast, title: "Title 1", user: user }

    before { login_as user }

    context "when valid params given" do
      let(:params) { { screencast: attributes_for(:screencast, title: "Title 2") } }

      it "should update screencast" do
        expect { subject }.to change { screencast.reload.title }.from("Title 1").to "Title 2"
      end
    end

    context "when invalid params given" do
      let(:params) { { screencast: { wrong: "params" } } }

      it "should not update screencast" do
        expect { subject }.not_to change { screencast.reload.attributes }
      end
    end

  end
end