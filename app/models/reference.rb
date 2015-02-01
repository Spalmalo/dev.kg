class Reference < ActiveRecord::Base
  belongs_to :video, inverse_of: :references

  validates_presence_of :video, :url
  validates_length_of :title, maximum: 255
end
