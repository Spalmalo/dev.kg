require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.to validate_length_of(:title).is_at_most(255) }
  it { is_expected.to validate_length_of(:description).is_at_most(4000) }

  it "should have valid vactory" do
    post = build(:post)
    expect(post).to be_valid
  end
end