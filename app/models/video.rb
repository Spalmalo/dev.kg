class Video < ActiveRecord::Base
  include Sluggable
  include Auditable
  include Publishable
  include Impressionable

  acts_as_taggable
  acts_as_paranoid

  validates_presence_of :title, :description, :video_url, :user
  validates_format_of :video_url, with: /\Ahttps?:\/\/www\.youtube\.com\/watch\?v\=.+/
  validates_length_of :title, maximum: 255
  validates_length_of :description, maximum: 4000
  validates_uniqueness_of :video_url

  belongs_to :user

  has_many :references, inverse_of: :video
  has_many :snippets, inverse_of: :video

  attr_readonly :video_url

  accepts_nested_attributes_for :references, reject_if: lambda { |a| a[:url].blank? }, allow_destroy: true

  scope :index, -> { order published_at: :desc }

end