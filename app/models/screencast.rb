class Screencast < Video
  has_one  :asciicast, inverse_of: :screencast, foreign_key: :parent_id

  accepts_nested_attributes_for :snippets,   reject_if: lambda { |a| a[:code].blank? },     allow_destroy: true
  accepts_nested_attributes_for :asciicast,  reject_if: lambda { |a| a[:content].blank? },  allow_destroy: true

end
