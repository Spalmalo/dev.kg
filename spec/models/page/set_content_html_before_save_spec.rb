require 'rails_helper'

describe Page, type: :model do

  describe "before save callback" do
    subject { page.save }

    let(:page) { build :page, content: "## Awesome", content_html: nil }

    it "should update content_html with rendered content" do
      expect { subject }.to change(page, :content_html).from(nil).to "<h2>Awesome</h2>\n"
    end
  end
end