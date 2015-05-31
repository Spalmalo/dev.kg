class Asciicast < ActiveRecord::Base
  include Auditable

  belongs_to :video, inverse_of: :asciicast

  validates_presence_of :video, :content
end
