class Impression < ActiveRecord::Base
  belongs_to :impressionable, polymorphic: true, required: true
  belongs_to :user, required: true

  validates_uniqueness_of :user_id, scope: [:impressionable_id, :impressionable_type]
  validate :impressionable_ownership

  private

    def impressionable_ownership
      errors.add(:user, :cannot_have_impression_on_own_content) if impressionable.try(:user) == user
    end
end
