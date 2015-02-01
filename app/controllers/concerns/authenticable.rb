module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :remember_requested_path, if: proc { request.get? }
    helper_method :warden, :signed_in?, :current_user
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end

  def authenticate!
    warden.authenticate!
  end

  def remember_requested_path
    session[:requested_path] = request.path
  end

end