require 'rails_helper'

describe Video, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :video_url }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.not_to allow_value("wrong").for(:video_url) }
  it { is_expected.not_to allow_value("http://google.com").for(:video_url) }
  it { is_expected.to allow_value("https://www.youtube.com/watch?v=qpgT_62y5kQ").for(:video_url) }

  it "should have valid vactory" do
    screencast = build(:screencast)
    expect(screencast).to be_valid
  end
end