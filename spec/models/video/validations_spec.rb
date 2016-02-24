require 'rails_helper'

describe Video, type: :model do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :video_url }
  it { is_expected.to validate_presence_of :user }

  it { is_expected.not_to allow_value("wrong").for(:video_url) }
  it { is_expected.not_to allow_value("http://google.com").for(:video_url) }
  it { is_expected.to allow_value("https://www.youtube.com/watch?v=qpgT_62y5kQ").for(:video_url) }

  it { is_expected.to validate_length_of(:title).is_at_most(255) }
  it { is_expected.to validate_length_of(:description).is_at_most(4000) }
  it { is_expected.to have_readonly_attribute :video_url }


  it "should validate uniqueness of video_url" do
    create :video, video_url: "https://www.youtube.com/watch?v=qpgT_62y5kQ"

    expect(build :video, video_url: "https://www.youtube.com/watch?v=qpgT_62y5kQ").not_to be_valid
  end

  it "should have valid vactory" do
    screencast = build(:screencast)
    expect(screencast).to be_valid
  end
end