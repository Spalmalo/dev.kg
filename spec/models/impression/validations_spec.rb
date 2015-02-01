require 'rails_helper'

describe Impression, type: :model do
  it { is_expected.to validate_presence_of :video }
  it { is_expected.to validate_presence_of :user }

  it "should validate uniqueness of video per user" do
    screencast = create :screencast
    user = create :user
    create :like, video: screencast, user: user

    expect {
      create :dislike, video: screencast, user: user
    }.to raise_error ActiveRecord::RecordInvalid
  end

  it "should not allow user to have impression on own videos" do
    user = create :user
    screencast = create :screencast, user: user

    expect {
      create :like, video: screencast, user: user
    }.to raise_error ActiveRecord::RecordInvalid
  end

  it "should have valid vactory" do
    impression = build(:impression)
    expect(impression).to be_valid
  end
end