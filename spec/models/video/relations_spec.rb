require 'rails_helper'

describe Video, type: :model do
  it { is_expected.to belong_to :user }
end