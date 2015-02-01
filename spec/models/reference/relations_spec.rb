require 'rails_helper'

describe Reference, type: :model do
  it { is_expected.to belong_to :video }
end