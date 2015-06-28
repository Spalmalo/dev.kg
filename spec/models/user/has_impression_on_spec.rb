require 'rails_helper'

describe User, type: :model do
  subject { user.has_impression_on? video }

  let!(:user) { create :user }
  let!(:video) { create :video }

  context "when user has impression on given video" do
    before { user.likes.create impressionable: video }

    it { is_expected.to eq true }
  end

  context "when user has no impression on given video" do
    it { is_expected.to eq false }
  end
end