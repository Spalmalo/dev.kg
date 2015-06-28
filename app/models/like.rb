class Like < Impression
  belongs_to :impressionable, counter_cache: true, polymorphic: true
end
