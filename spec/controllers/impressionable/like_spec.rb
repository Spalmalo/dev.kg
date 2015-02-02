require 'rails_helper'

describe ImpressionableController, type: :controller do
  describe "POST 'like'" do
    subject { post :like, params }

    let!(:user) { create :user }

    before { login_as user }

    context "when impressionable resource is screencast" do
      let!(:screencast) { create :screencast }
      let(:params) { { screencast_id: screencast.id } }

      context "when user has no impressions on given screencast" do
        it "should create new like" do
          expect { subject }.to change(Like, :count).by 1
        end
      end

      context "when user has impression on given screencast already" do
        before { Like.create user: user, video: screencast }

        it "should not create new like" do
          expect { subject }.not_to change(Like, :count)
        end
      end

      context "when screencast belongs to user" do
        let!(:screencast) { create :screencast, user: user }

        it "should not create new like" do
          expect { subject }.not_to change(Like, :count)
        end
      end
    end

    context "when impressionable resource is clip" do
      let!(:clip) { create :clip }
      let(:params) { { clip_id: clip.id } }

      context "when user has no impressions on given clip" do
        it "should create new like" do
          expect { subject }.to change(Like, :count).by 1
        end
      end

      context "when user has impression on given clip already" do
        before { Like.create user: user, video: clip }

        it "should not create new like" do
          expect { subject }.not_to change(Like, :count)
        end
      end

      context "when clip belongs to user" do
        let!(:clip) { create :clip, user: user }

        it "should not create new like" do
          expect { subject }.not_to change(Like, :count)
        end
      end
    end

  end
end