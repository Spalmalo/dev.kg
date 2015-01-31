require 'rails_helper'

describe 'GET /clips/:id' do
  subject { response }

  let!(:clip) { create :clip }

  before { get "/clips/#{ id }" }

  context "when valid id given" do
    let(:id) { clip.to_param }

    it { is_expected.to be_successful }

    it "should include clip" do
      expect(subject.body).to include clip.title
    end
  end

  context "when invalid id given" do
    let(:id) { "wrong" }

    include_examples "a 'page not found' error page"
  end
end