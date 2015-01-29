class Screencast < ActiveRecord::Base
  include Sluggable

  validates_presence_of :title, :description, :video_url, :user
  validates_format_of :video_url, with: /https?:\/\/www\.youtube\.com\/watch\?v\=.+/

  scope :index, -> { order created_at: :desc }

  belongs_to :user, inverse_of: :screencasts
end
