class Dislike < Impression
  belongs_to :impressionable, counter_cache: true, polymorphic: true
end
