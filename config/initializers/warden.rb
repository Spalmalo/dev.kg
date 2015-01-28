Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find_by_id(id)
end

class OauthStrategy < ::Warden::Strategies::Base
  def authenticate!
    begin
      user = User.from_oauth_hash request.env['omniauth.auth']
    rescue
      fail! message: "strategies.oauth.failed"
    else
      success! user
    end
  end
end

Warden::Strategies.add(:oauth, OauthStrategy)

Rails.application.config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
  manager.default_strategies :oauth
  manager.failure_app = UnauthorizedController
end