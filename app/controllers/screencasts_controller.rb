class ScreencastsController < ApplicationController

  def index
    @screencasts = Screencast.index.page(params[:page]).per(10)
  end

  def show
    @screencast = Screencast.index.friendly.find params[:id]
  end

end
