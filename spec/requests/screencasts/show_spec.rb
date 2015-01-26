require 'rails_helper'

describe 'GET /screencasts/:id' do
  subject { response }

  before { get "/screencasts/#{ screencast.to_param }" }

  let!(:screencast) { create :screencast }

  it { should be_successful }
end