class Asciicast < ActiveRecord::Base
  belongs_to :video, inverse_of: :asciicast

  validates_presence_of :video, :content
end
