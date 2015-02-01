require 'rails_helper'

describe ClipsController, type: :controller do
  describe "PUT 'update'" do
    subject { put :update, ({id: clip.to_param}).merge(params) }

    let!(:user) { create :user }
    let!(:clip) { create :clip, title: "Title 1", user: user }

    before { login_as user }

    context "when valid params given" do
      let(:params) { { clip: attributes_for(:clip, title: "Title 2") } }

      it "should update clip" do
        expect { subject }.to change { clip.reload.title }.from("Title 1").to "Title 2"
      end
    end

    context "when invalid params given" do
      let(:params) { { clip: { wrong: "params" } } }

      it "should not update clip" do
        expect { subject }.not_to change { clip.reload.attributes }
      end
    end

  end
end