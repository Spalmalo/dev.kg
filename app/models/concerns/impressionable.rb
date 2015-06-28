module Impressionable
  extend ActiveSupport::Concern

  included do
    has_many :impressions, as: :impressionable
    has_many :likes, as: :impressionable
    has_many :dislikes, as: :impressionable
  end

  def rating
    likes_count - dislikes_count
  end

end