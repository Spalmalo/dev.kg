class SessionsController < ApplicationController

  def create
    user = User.from_oauth_hash request.env['omniauth.auth']
    redirect_to root_path, notice: 'Awesome'
  end

end
