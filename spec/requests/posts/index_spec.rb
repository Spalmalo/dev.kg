require 'rails_helper'

describe 'GET /clips' do
  subject { get '/clips'; response }

  let!(:clips) { create_list :clip, 3 }

  it { is_expected.to be_successful }

  it "should contain clips list" do
    clips.map(&:title).each do |title|
      expect(subject.body).to include title
    end
  end
end