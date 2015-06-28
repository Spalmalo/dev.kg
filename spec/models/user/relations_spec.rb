require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:screencasts).dependent(:destroy) }
  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:impressions).dependent(:destroy) }
  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :dislikes }
end