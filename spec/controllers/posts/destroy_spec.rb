require 'rails_helper'

describe PostsController, type: :controller do
  describe "DELETE 'destroy'" do
    subject { delete :destroy, id: _post.to_param }

    let!(:user) { create :user }
    before { login_as user }

    context "when post belongs to current user" do
      let!(:_post) { create :post, user: user }

      it "should destroy post" do
        subject
        expect(Post.exists? _post.id).to eq false
      end

    end

    context "when post belongs to other user" do
      let!(:_post) { create :post }

      it "should not destroy any posts" do
        expect { subject }.not_to change(Post, :count)
      end

    end

  end
end