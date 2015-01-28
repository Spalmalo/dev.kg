class UnauthorizedController < ActionController::Metal
  include ActionController::UrlFor
  include ActionController::Redirecting
  include Rails.application.routes.url_helpers
  include Rails.application.routes.mounted_helpers

  delegate :flash, :to => :request

  def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    message = env['warden.options'].fetch(:message, "session.unauthorized")
    flash.alert = I18n.t(message)

    redirect_to sign_in_path
  end
end