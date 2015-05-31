class Page < ActiveRecord::Base
  include Sluggable
  include Auditable
  include Renderable

  validates_presence_of :title, :content

end
