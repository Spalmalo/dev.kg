class Article < ActiveRecord::Base
  include Auditable
  include Renderable

  validates_presence_of :content
end
