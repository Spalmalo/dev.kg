class SessionsController < ApplicationController

  def new
  end

  def create
    warden.authenticate!
    redirect_to session.fetch('requested_path', :root), notice: t('session.created', nickname: current_user.nickname)
  end

  def destroy
    warden.logout
    redirect_to :root, notice: t('session.destroyed')
  end

end
