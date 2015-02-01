class Video < ActiveRecord::Base
  include Sluggable

  validates_presence_of :title, :description, :video_url, :user
  validates_format_of :video_url, with: /\Ahttps?:\/\/www\.youtube\.com\/watch\?v\=.+/
  validates_length_of :title, maximum: 255
  validates_length_of :description, maximum: 400
  validates_uniqueness_of :video_url

  belongs_to :user

  has_many :references, dependent: :destroy, inverse_of: :video
end