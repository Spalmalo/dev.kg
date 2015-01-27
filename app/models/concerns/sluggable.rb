module Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    def normalize_friendly_id(text)
      text.to_slug.normalize! transliterations: [:russian, :latin]
    end

    def slug_candidates
      [
        :title,
        [:title, :id]
      ]
    end
  end


end