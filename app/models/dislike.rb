class Dislike < Impression
  belongs_to :video, counter_cache: true
end
