require 'rails_helper'

describe 'GET /' do
  subject { response }

  before { get '/' }

  it { should be_successful }
end