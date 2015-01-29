class ScreencastsController < ApplicationController

  before_action :authenticate!, only: :new

  def index
    @screencasts = Screencast.index.page(params[:page]).per(10)
  end

  def show
    @screencast = Screencast.index.friendly.find params[:id]
  end

  def new
    @screencast = Screencast.new
  end

end
