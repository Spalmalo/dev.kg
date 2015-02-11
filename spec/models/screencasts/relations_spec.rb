require 'rails_helper'

describe Screencast, type: :model do
  it { is_expected.to accept_nested_attributes_for(:snippets).allow_destroy(true) }
  it { is_expected.to accept_nested_attributes_for(:asciicast).allow_destroy(true) }
end