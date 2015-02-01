require 'rails_helper'

describe Reference, type: :model do
  it { is_expected.to validate_presence_of :video }
  it { is_expected.to validate_presence_of :url }

  it { is_expected.to ensure_length_of(:title).is_at_most(255) }

  it "should have valid vactory" do
    reference = build(:reference)
    expect(reference).to be_valid
  end
end