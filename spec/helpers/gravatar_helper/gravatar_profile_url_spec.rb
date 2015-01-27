require 'rails_helper'

describe GravatarHelper do
  describe ".gravatar_profile_url" do
    subject { gravatar_profile_url email }

    let(:email) { "some@email.com" }
    let(:size) { 80 }

    it "should return proper url" do
      expect(subject).to eq "http://www.gravatar.com/d8ffeba65ee5baf57e4901690edc8e1b"
    end
  end
end