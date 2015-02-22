require 'rails_helper'

describe VideosHelper, '.video_publish_date' do
  subject { video_publish_date video }

  context "when video in published" do
    let!(:video) { create :video, published_at: Time.parse("2015-02-21 14:05:24 +0600") }

    before { Timecop.freeze }
    after { Timecop.return }

    it { is_expected.to eq "Опубликовано: <time datetime=\"2015-02-21 14:05:24 +0600\" title=\"21 февраля 2015, 14:05\">21 февр., 14:05</time>" }
  end

  context "when video isn't published" do
    let!(:video) { create :video, published_at: nil }

    it { is_expected.to eq "<span class=\"label label-warning\">не опубликовано</span>" }
  end
end