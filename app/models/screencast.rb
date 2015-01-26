class Screencast < ActiveRecord::Base

  validates_presence_of :title, :description, :video_url
  validates_format_of :video_url, with: /https?:\/\/www\.youtube\.com\/watch\?v\=.+/
end
