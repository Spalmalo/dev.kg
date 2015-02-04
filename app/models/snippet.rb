class Snippet < ActiveRecord::Base
  belongs_to :video, inverse_of: :snippets

  validates_presence_of :video, :code, :language
  validates_length_of :description, maximum: 255

  enum language: %w[ruby scss json xml bash coffeescript sql]
end
