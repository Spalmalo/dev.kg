require 'rails_helper'

describe 'GET /:id' do
  subject { response }

  let!(:page) { create :page }
  before { get "/#{ id }" }

  context "when valid id given" do

    let(:id) { page.to_param }

    it { is_expected.to be_successful }

    it "should include page" do
      expect(subject.body).to include page.title
    end
  end

  context "when invalid id given" do
    let(:id) { "wrong" }

    include_examples "a 'page not found' error page"
  end
end