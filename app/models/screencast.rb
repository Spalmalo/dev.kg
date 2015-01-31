class Screencast < Video
  scope :index, -> { order created_at: :desc }

end
