class Snippet < ActiveRecord::Base
  include Auditable

  belongs_to :video, inverse_of: :snippets

  validates_presence_of :video, :code, :language
  validates_length_of :description, maximum: 255

  enum language: %w[ruby objectivec swift coffeescript javascript scss css less erb python sql haml json xml bash php clojure cpp elixir erlang perl lua java go markdown rust scala haskell]
end
