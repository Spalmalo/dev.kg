class ApplicationController < ActionController::Base
  include Authenticable
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV["BASIC_AUTH_USER"], password: ENV["BASIC_AUTH_PASS"] if ENV["BASIC_AUTH_USER"] and ENV["BASIC_AUTH_PASS"]

  rescue_from ActiveRecord::RecordNotFound do |ex|
    render '404', status: 404
  end

  rescue_from CanCan::AccessDenied do |ex|
    render '403', status: 403
  end
end
