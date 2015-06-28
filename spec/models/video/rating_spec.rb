require 'rails_helper'

describe Video, type: :model do
  describe "#rating" do
    subject { video.rating }

    let!(:video) { create :video }

    before do
      10.times  { create :like,     impressionable: video }
      3.times   { create :dislike,  impressionable: video }
      video.reload
    end

    it "should return proper video rating value" do
      expect(subject).to eq 7
    end
  end
end