module WardenControllerHelpers
  def login_as user
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers, type: :request
  config.include WardenControllerHelpers, type: :controller
end