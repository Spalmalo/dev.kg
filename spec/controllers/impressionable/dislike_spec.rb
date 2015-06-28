require 'rails_helper'

describe ImpressionableController, type: :controller do
  describe "POST 'dislike'" do
    subject { post :dislike, params }

    let!(:user) { create :user }

    before { login_as user }

    context "when impressionable resource is screencast" do
      let!(:screencast) { create :screencast }
      let(:params) { { screencast_id: screencast.id } }

      context "when user has no impressions on given screencast" do
        it "should create new dislike" do
          expect { subject }.to change(Dislike, :count).by 1
        end
      end

      context "when user has impression on given screencast already" do
        before { Dislike.create user: user, impressionable: screencast }

        it "should not create new dislike" do
          expect { subject }.not_to change(Dislike, :count)
        end
      end

      context "when screencast belongs to user" do
        let!(:screencast) { create :screencast, user: user }

        it "should not create new dislike" do
          expect { subject }.not_to change(Dislike, :count)
        end
      end
    end

    context "when impressionable resource is clip" do
      let!(:clip) { create :clip }
      let(:params) { { clip_id: clip.id } }

      context "when user has no impressions on given clip" do
        it "should create new dislike" do
          expect { subject }.to change(Dislike, :count).by 1
        end
      end

      context "when user has impression on given clip already" do
        before { Dislike.create user: user, impressionable: clip }

        it "should not create new dislike" do
          expect { subject }.not_to change(Dislike, :count)
        end
      end

      context "when clip belongs to user" do
        let!(:clip) { create :clip, user: user }

        it "should not create new dislike" do
          expect { subject }.not_to change(Dislike, :count)
        end
      end
    end

  end
end