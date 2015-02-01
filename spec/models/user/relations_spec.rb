require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:screencasts).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
  it { is_expected.to have_many(:dislikes).dependent(:destroy) }
end