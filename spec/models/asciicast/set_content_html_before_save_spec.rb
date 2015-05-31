require 'rails_helper'

describe Asciicast, type: :model do

  describe "before save callback" do
    subject { asciicast.save }

    let(:asciicast) { build :asciicast, content: "## Awesome", content_html: nil }

    it "should update content_html with rendered content" do
      expect { subject }.to change(asciicast, :content_html).from(nil).to "<h2>Awesome</h2>\n"
    end
  end
end