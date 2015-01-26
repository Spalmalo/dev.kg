require 'rails_helper'

describe YoutubeHelper do
  describe ".youtube_embed" do
    subject { youtube_embed url }

    let(:url) { "https://www.youtube.com/watch?v=6_7AqiFd1s8" }

    it "should return proper video id" do
      expect(subject).to eq "<iframe src=\"//www.youtube.com/embed/6_7AqiFd1s8\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe>"
    end
  end
end