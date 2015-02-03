class Snippet < ActiveRecord::Base
  belongs_to :video, inverse_of: :snippets

  validates_presence_of :video, :file, :code, :language
  validates_length_of :file, maximum: 255

  enum language: %w[ruby scss json xml shell coffeescript sql]
end
