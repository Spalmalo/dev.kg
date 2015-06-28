require 'rails_helper'

describe Article, type: :model do

  describe "before save callback" do
    subject { article.save }

    let(:article) { build :article, content: "## Awesome", content_html: nil }

    it "should update content_html with rendered content" do
      expect { subject }.to change(article, :content_html).from(nil).to "<h2>Awesome</h2>\n"
    end
  end
end