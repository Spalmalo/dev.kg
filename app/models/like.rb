class Like < Impression
  belongs_to :video, counter_cache: true
end
