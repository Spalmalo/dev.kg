require 'rails_helper'

describe ClipsController, type: :controller do
  describe "POST 'create'" do
    subject { post :create, params }

    let!(:user) { create :user }

    before { login_as user }

    context "when valid params given" do
      let(:params) { { clip: attributes_for(:clip) } }

      it "should create new screencasts" do
        expect { subject }.to change(Clip, :count).by 1
      end

      describe "created clip" do
        subject { super(); Clip.last }

        it "should have proper user" do
          expect(subject.user).to eq user
        end
      end
    end

    context "when invalid params given" do
      let(:params) { { clip: { wrong: "params" } } }

      it "should not create any screencasts" do
        expect { subject }.not_to change Clip, :count
      end
    end

  end
end