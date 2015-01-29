require 'rails_helper'

describe ScreencastsController, type: :controller do
  describe "POST 'create'" do
    subject { post :create, params }

    let!(:user) { create :user }

    before { login_as user }

    context "when valid params given" do
      let(:params) { { screencast: attributes_for(:screencast) } }

      it "should create new screencasts" do
        expect { subject }.to change(Screencast, :count).by 1
      end

      describe "created screencast" do
        subject { super(); Screencast.last }

        it "should have proper user" do
          expect(subject.user).to eq user
        end
      end
    end

    context "when invalid params given" do
      let(:params) { { screencast: { wrong: "params" } } }

      it "should not create any screencasts" do
        expect { subject }.not_to change Screencast, :count
      end
    end

  end
end