require 'rails_helper'

describe 'GET /screencasts/:id' do
  subject { response }

  let!(:screencast) { create :screencast }

  before { get "/screencasts/#{ screencast.to_param }" }

  it { is_expected.to be_successful }
end