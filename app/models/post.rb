class Post < ActiveRecord::Base
  include Sluggable
  include Auditable
  include Publishable
  include Impressionable

  belongs_to :user, inverse_of: :posts, required: true
  has_one  :post_article, inverse_of: :post, foreign_key: :parent_id, dependent: :destroy

  accepts_nested_attributes_for :post_article

  validates_presence_of :title, :description, :post_article
  validates_length_of :title, maximum: 255
  validates_length_of :description, maximum: 4000

  scope :index, -> { order created_at: :desc }

end
