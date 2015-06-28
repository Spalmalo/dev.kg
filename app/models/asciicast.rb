class Asciicast < Article

  belongs_to :screencast, inverse_of: :asciicast, required: true, foreign_key: :parent_id

end
