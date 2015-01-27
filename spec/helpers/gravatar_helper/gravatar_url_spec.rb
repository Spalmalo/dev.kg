require 'rails_helper'

describe GravatarHelper do
  describe ".gravatar_url" do
    subject { gravatar_url email, size }

    let(:email) { "some@email.com" }
    let(:size) { 80 }

    it "should return proper url" do
      expect(subject).to eq "http://www.gravatar.com/avatar/d8ffeba65ee5baf57e4901690edc8e1b?s=80"
    end
  end
end