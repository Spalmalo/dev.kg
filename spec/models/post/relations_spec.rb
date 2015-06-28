require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:dislikes) }
end