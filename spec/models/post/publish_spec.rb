require 'rails_helper'

describe Post, type: :model do
  describe "#publish!" do
    subject { post.publish! }

    before { Timecop.freeze }

    after { Timecop.return }

    context "when post wasn't published" do
      let!(:post) { create :post, published_at: nil }

      it "should set published_at timestamp" do
        expect { subject }.to change(post, :published_at).from(nil).to Time.now
      end
    end

    context "when post was published already" do
      let!(:post) { create :post, published_at: 1.day.ago }

      it "should not update published_at timestamp" do
        expect { subject }.not_to change(post, :published_at).from(1.day.ago)
      end
    end
  end
end