class Impression < ActiveRecord::Base
  belongs_to :video
  belongs_to :user

  validates_presence_of :video, :user
  validates_uniqueness_of :user_id, scope: :video_id
  validate :video_ownership

  private

    def video_ownership
      errors.add(:user, :cannot_have_impression_on_own_videos) if video.try(:user) == user
    end
end
