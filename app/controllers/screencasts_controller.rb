class ScreencastsController < ApplicationController

  def index
    @screencasts = Screencast.index.page(params[:page]).per(10)
  end

  def show
  end

end
