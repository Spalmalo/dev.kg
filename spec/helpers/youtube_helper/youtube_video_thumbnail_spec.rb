require 'rails_helper'

describe YoutubeHelper do
  describe ".youtube_video_thumbnail" do
    subject { youtube_video_thumbnail url }

    let(:url) { "https://www.youtube.com/watch?v=6_7AqiFd1s8" }

    it "should return proper video thumbnail url" do
      expect(subject).to eq "http://img.youtube.com/vi/6_7AqiFd1s8/hqdefault.jpg"
    end
  end
end