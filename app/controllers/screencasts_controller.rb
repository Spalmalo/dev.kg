class ScreencastsController < ApplicationController

  before_action :authenticate!, only: [:new, :create]

  def index
    @screencasts = Screencast.index.page(params[:page]).per(10)
  end

  def show
    @screencast = Screencast.index.friendly.find params[:id]
  end

  def new
    @screencast = Screencast.new
  end

  def create
    @screencast = Screencast.new screencast_params.merge(user: current_user)
    if @screencast.save
      redirect_to @screencast
    else
      render :new, status: 422
    end
  end

  private

    def screencast_params
      params.require(:screencast).permit  :title,
                                          :description,
                                          :video_url
    end

end
