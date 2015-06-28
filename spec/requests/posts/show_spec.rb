require 'rails_helper'

describe 'GET /posts/:id' do
  subject { response }

  let!(:post) { create :post }

  before { get "/posts/#{ id }" }

  context "when valid id given" do
    let(:id) { post.to_param }

    it { is_expected.to be_successful }

    it "should include post" do
      expect(subject.body).to include post.title
    end
  end

  context "when invalid id given" do
    let(:id) { "wrong" }

    include_examples "a 'page not found' error page"
  end
end