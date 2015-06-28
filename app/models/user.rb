class User < ActiveRecord::Base
  include Oauth

  enum role: %w(author moderator admin)

  validates_presence_of :provider, :uid, :nickname
  validates_uniqueness_of :uid, scope: :provider

  has_many :screencasts, dependent: :destroy, inverse_of: :user
  has_many :posts, dependent: :destroy, inverse_of: :user

  has_many :impressions, dependent: :destroy
  has_many :likes
  has_many :dislikes

  def has_impression_on? video
    impressions.where(video: video).any?
  end
end
