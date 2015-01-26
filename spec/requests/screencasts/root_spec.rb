require 'rails_helper'

describe 'GET /screencasts' do
  subject { response }

  before { get '/screencasts' }

  it { should redirect_to root_path }
end