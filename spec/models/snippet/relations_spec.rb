require 'rails_helper'

describe Snippet, type: :model do
  it { is_expected.to belong_to :video }
end