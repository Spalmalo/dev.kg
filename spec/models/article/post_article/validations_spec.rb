require 'rails_helper'

describe PostArticle, type: :model do
  it { is_expected.to validate_presence_of :post }

  it "should have valid vactory" do
    post_article = build(:post_article)
    expect(post_article).to be_valid
  end
end