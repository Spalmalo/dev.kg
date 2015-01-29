class User < ActiveRecord::Base
  include Oauth

  validates_presence_of :provider, :uid, :nickname
  validates_uniqueness_of :uid, scope: :provider

  has_many :screencasts, dependent: :destroy, inverse_of: :user

end
