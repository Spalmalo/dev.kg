require 'rails_helper'

describe ReferencesHelper, '.reference_title' do
  subject { reference_title reference }

  context "when reference has title" do
    let(:reference) { build :reference, title: "Awesome!" }

    it "should return title unchanged" do
      expect(subject).to eq "Awesome!"
    end
  end

  context "when reference title is blank" do
    let(:reference) { build :reference, title: "", url: "http://very.very.very/long/looong/loooooooooong-loooooooooooooooong-loooooooooooooooooooooong.url" }

    it "should return truncated url" do
      expect(subject).to eq "http://very.very.very/long/looong/loooooooooong..."
    end
  end
end