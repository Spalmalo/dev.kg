require 'rails_helper'

describe Impression, type: :model do
  it { is_expected.to validate_presence_of :impressionable }
  it { is_expected.to validate_presence_of :user }

  it "should validate uniqueness of impressionable per user" do
    screencast = create :screencast
    user = create :user
    create :like, impressionable: screencast, user: user

    expect {
      create :dislike, impressionable: screencast, user: user
    }.to raise_error ActiveRecord::RecordInvalid
  end

  it "should not allow user to have impression on own content" do
    user = create :user
    screencast = create :screencast, user: user

    expect {
      create :like, impressionable: screencast, user: user
    }.to raise_error ActiveRecord::RecordInvalid
  end

  it "should have valid vactory" do
    impression = build(:impression)
    expect(impression).to be_valid
  end
end