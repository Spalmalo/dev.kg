require 'rails_helper'

describe 'GET /screencasts/:id' do
  subject { response }

  let!(:screencast) { create :screencast }

  before { get "/screencasts/#{ id }" }

  context "when valid id given" do
    let(:id) { screencast.to_param }

    it { is_expected.to be_successful }

    it "should include screencast" do
      expect(subject.body).to include screencast.title
    end
  end

  context "when invalid id given" do
    let(:id) { "wrong" }

    include_examples "a 'page not found' error page"
  end
end