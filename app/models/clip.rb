class Clip < Video
  scope :index, -> { order created_at: :desc }
end
