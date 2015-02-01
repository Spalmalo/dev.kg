class Screencast < Video
  scope :index, -> { order created_at: :desc }

  accepts_nested_attributes_for :references , reject_if: lambda { |a| a[:url].blank? }, allow_destroy: true
end
