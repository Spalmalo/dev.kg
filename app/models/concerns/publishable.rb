module Publishable
  extend ActiveSupport::Concern

  included do
    scope :published, -> { where.not published_at: nil }
    scope :unpublished, -> { where published_at: nil }

    scope :for_user, lambda { |user|
      if user
        where arel_table[:user_id].eq(user.id).or(arel_table[:published_at].not_eq nil)
      else
        published
      end
    }
  end

  def publish!
    return false if published?
    touch :published_at
  end

  def published?
    published_at.present?
  end

end