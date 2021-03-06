require 'rails_helper'

describe Asciicast, type: :model do
  it { is_expected.to validate_presence_of :screencast }

  it "should have valid vactory" do
    asciicast = build(:asciicast)
    expect(asciicast).to be_valid
  end
end