require 'rails_helper'

describe 'GET /screencasts' do
  subject { response }

  before { get '/screencasts' }

  it { is_expected.to redirect_to root_path }
end