require 'rails_helper'

describe Screencast, type: :model do
  it { is_expected.to belong_to :user }
end