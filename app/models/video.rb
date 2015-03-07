class Video < ActiveRecord::Base
  include Sluggable

  acts_as_taggable

  validates_presence_of :title, :description, :video_url, :user
  validates_format_of :video_url, with: /\Ahttps?:\/\/www\.youtube\.com\/watch\?v\=.+/
  validates_length_of :title, maximum: 255
  validates_length_of :description, maximum: 4000
  validates_uniqueness_of :video_url

  belongs_to :user

  has_many :references,   dependent: :destroy, inverse_of: :video
  has_many :snippets,     dependent: :destroy, inverse_of: :video
  has_one  :asciicast,    dependent: :destroy, inverse_of: :video
  has_many :likes,        dependent: :destroy
  has_many :dislikes,     dependent: :destroy

  attr_readonly :video_url

  accepts_nested_attributes_for :references, reject_if: lambda { |a| a[:url].blank? },      allow_destroy: true

  scope :index, -> { order published_at: :desc }
  scope :published, -> { where.not published_at: nil }

  scope :for_user, lambda { |user|
    if user
      where arel_table[:user_id].eq(user.id).or(arel_table[:published_at].not_eq nil)
    else
      published
    end
  }

  def rating
    likes_count - dislikes_count
  end

  def publish!
    return false if published?
    touch :published_at
  end

  def published?
    published_at.present?
  end

end