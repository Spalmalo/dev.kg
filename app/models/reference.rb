class Reference < ActiveRecord::Base
  include Auditable

  belongs_to :video, inverse_of: :references

  validates_presence_of :video, :url
  validates_length_of :title, maximum: 255
  validates_format_of :url, with: URI.regexp(["http", "https", "ftp"])

end
