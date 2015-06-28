require 'rails_helper'

describe PostsController, type: :controller do
  describe "PUT 'update'" do
    subject { put :update, ({id: _post.to_param}).merge(params) }

    let!(:user) { create :user }
    let!(:_post) { create :post, title: "Title 1", user: user }

    before { login_as user }

    context "when valid params given" do
      let(:params) { { post: attributes_for(:post, title: "Title 2") } }

      it "should update post" do
        expect { subject }.to change { _post.reload.title }.from("Title 1").to "Title 2"
      end
    end

    context "when invalid params given" do
      let(:params) { { post: { wrong: "params" } } }

      it "should not update post" do
        expect { subject }.not_to change { _post.reload.attributes }
      end
    end

  end
end