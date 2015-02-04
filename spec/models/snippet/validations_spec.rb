require 'rails_helper'

describe Snippet, type: :model do
  it { is_expected.to validate_presence_of :video }
  it { is_expected.to validate_presence_of :code }
  it { is_expected.to validate_presence_of :language }

  it { is_expected.to validate_length_of(:description).is_at_most(255) }

  it "should have valid vactory" do
    snippet = build(:snippet)
    expect(snippet).to be_valid
  end
end