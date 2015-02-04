require 'rails_helper'

describe Asciicast, type: :model do
  it { is_expected.to belong_to :video }

end