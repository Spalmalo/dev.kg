class Asciicast < ActiveRecord::Base
  belongs_to :video

  validates_presence_of :video, :content
end
