require 'rails_helper'

describe Impression, type: :model do
  it { is_expected.to belong_to :impressionable }
  it { is_expected.to belong_to :user }

end