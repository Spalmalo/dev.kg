require 'rails_helper'

describe 'GET /:id' do
  subject { response }

  let!(:page) { create :page }

  before { get "/#{ page.to_param }" }

  it { is_expected.to be_successful }

  it "should include page" do
    expect(subject.body).to include page.title
  end
end