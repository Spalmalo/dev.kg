require 'rails_helper'

describe YoutubeHelper do
  describe ".youtube_video_id" do
    subject { youtube_video_id url }

    let(:url) { "https://www.youtube.com/watch?v=6_7AqiFd1s8" }

    it "should return proper video id" do
      expect(subject).to eq "6_7AqiFd1s8"
    end
  end
end