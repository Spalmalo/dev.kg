require 'rails_helper'

describe 'GET /' do
  subject { get '/'; response }

  let!(:screencasts) { create_list :screencast, 3 }
  let!(:clips) { create_list :clip, 3 }

  it { is_expected.to be_successful }

  it "should contain screencasts & clips list" do
    (screencasts + clips).map(&:title).each do |title|
      expect(subject.body).to include title
    end
  end
end