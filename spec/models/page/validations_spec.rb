require 'rails_helper'

describe Page, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :content }

  it "should have valid vactory" do
    page = build(:page)
    expect(page).to be_valid
  end
end