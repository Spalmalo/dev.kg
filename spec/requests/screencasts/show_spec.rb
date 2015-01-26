require 'rails_helper'

describe 'GET /screencasts/:id' do
  subject { response }

  let!(:screencast) { create :screencast }

  before { get "/screencasts/#{ screencast.to_param }" }

  it { is_expected.to be_successful }

  it "should include screencast" do
    expect(subject.body).to include screencast.title
  end
end