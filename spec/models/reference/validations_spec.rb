require 'rails_helper'

describe Reference, type: :model do
  it { is_expected.to validate_presence_of :video }
  it { is_expected.to validate_presence_of :url }

  it { is_expected.to validate_length_of(:title).is_at_most(255) }

  it { is_expected.not_to allow_value("wrong").for(:url) }
  it { is_expected.to allow_value("ftp://some.ftp/server").for(:url) }
  it { is_expected.to allow_value("http://some.http/server").for(:url) }
  it { is_expected.to allow_value("https://some.https/server").for(:url) }

  it "should have valid vactory" do
    reference = build(:reference)
    expect(reference).to be_valid
  end
end