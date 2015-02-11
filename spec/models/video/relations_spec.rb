require 'rails_helper'

describe Video, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:references).dependent :destroy }
  it { is_expected.to have_many(:snippets).dependent :destroy }
  it { is_expected.to have_many(:likes).dependent :destroy }
  it { is_expected.to have_many(:dislikes).dependent :destroy }
  it { is_expected.to have_one(:asciicast).dependent :destroy }
  it { is_expected.to accept_nested_attributes_for(:references).allow_destroy(true) }
end