require 'rails_helper'

describe Screencast, type: :model do
  it { is_expected.to accept_nested_attributes_for(:references).allow_destroy(true) }
end