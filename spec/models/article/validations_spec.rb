require 'rails_helper'

describe Article, type: :model do
  it { is_expected.to validate_presence_of :content }

  it "should have valid vactory" do
    article = build(:article)
    expect(article).to be_valid
  end
end