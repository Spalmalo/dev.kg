class Article < ActiveRecord::Base
  include Auditable
  include Renderable

  acts_as_paranoid

  validates_presence_of :content
end
