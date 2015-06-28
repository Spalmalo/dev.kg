class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts, required: true

  validates_presence_of :title, :description
  validates_length_of :title, maximum: 255
  validates_length_of :description, maximum: 4000
end
