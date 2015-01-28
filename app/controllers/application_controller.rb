class ApplicationController < ActionController::Base
  include Authenticable
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |ex|
    render '404', status: 404
  end
end
