require 'rails_helper'

describe Video, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:references) }
  it { is_expected.to have_many(:snippets) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:dislikes) }
  it { is_expected.to have_one(:asciicast) }
  it { is_expected.to accept_nested_attributes_for(:references).allow_destroy(true) }
end