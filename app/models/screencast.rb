class Screencast < Video
  scope :index, -> { order created_at: :desc }

  accepts_nested_attributes_for :snippets,   reject_if: lambda { |a| a[:code].blank? },     allow_destroy: true
  accepts_nested_attributes_for :asciicast,  reject_if: lambda { |a| a[:content].blank? },  allow_destroy: true
end
