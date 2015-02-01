require 'rails_helper'

describe Video, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:references).dependent :destroy }
end