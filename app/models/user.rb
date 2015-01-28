class User < ActiveRecord::Base

  validates_presence_of :provider, :uid, :nickname
  validates_uniqueness_of :uid, scope: :provider
end
