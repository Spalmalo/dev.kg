require 'rails_helper'

describe PostsController, type: :controller do
  describe "POST 'create'" do
    subject { post :create, params }

    let!(:user) { create :user }

    before { login_as user }

    context "when valid params given" do
      let(:params) { { post: attributes_for(:post) } }

      it "should create new screencasts" do
        expect { subject }.to change(Post, :count).by 1
      end

      describe "created post" do
        subject { super(); Post.last }

        it "should have proper user" do
          expect(subject.user).to eq user
        end
      end
    end

    context "when invalid params given" do
      let(:params) { { post: { wrong: "params" } } }

      it "should not create any screencasts" do
        expect { subject }.not_to change Post, :count
      end
    end

  end
end