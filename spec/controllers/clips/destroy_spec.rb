require 'rails_helper'

describe ClipsController, type: :controller do
  describe "DELETE 'destroy'" do
    subject { delete :destroy, id: clip.to_param }

    let!(:user) { create :user }
    before { login_as user }

    context "when clip belongs to current user" do
      let!(:clip) { create :clip, user: user }

      it "should destroy clip" do
        subject
        expect(Clip.exists? clip.id).to eq false
      end

    end

    context "when clip belongs to other user" do
      let!(:clip) { create :clip }

      it "should not destroy any clips" do
        expect { subject }.not_to change(Clip, :count)
      end

    end

  end
end