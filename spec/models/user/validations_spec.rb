require 'rails_helper'

describe User, type: :model do
  it { is_expected.to validate_presence_of :provider }
  it { is_expected.to validate_presence_of :uid }
  it { is_expected.to validate_presence_of :nickname }

  it { is_expected.to validate_uniqueness_of(:uid).scoped_to :provider }

  it "should have valid vactory" do
    user = build(:user)
    expect(user).to be_valid
  end
end