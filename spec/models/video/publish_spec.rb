require 'rails_helper'

describe Video, type: :model do
  describe "#publish!" do
    subject { video.publish! }

    before { Timecop.freeze }

    after { Timecop.return }

    context "when video wasn't published" do
      let!(:video) { create :video, published_at: nil }

      it "should set published_at timestamp" do
        expect { subject }.to change(video, :published_at).from(nil).to Time.now
      end
    end

    context "when video was published already" do
      let!(:video) { create :video, published_at: 1.day.ago }

      it "should not update published_at timestamp" do
        expect { subject }.not_to change(video, :published_at).from(1.day.ago)
      end
    end
  end
end