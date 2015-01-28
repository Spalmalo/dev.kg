class Page < ActiveRecord::Base
  include Sluggable

  validates_presence_of :title, :content

end
