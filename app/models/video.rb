class Video < ActiveRecord::Base
  include Sluggable

  validates_presence_of :title, :description, :video_url, :user
  validates_format_of :video_url, with: /https?:\/\/www\.youtube\.com\/watch\?v\=.+/

  belongs_to :user
end