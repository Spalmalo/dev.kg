class ScreencastsController < ApplicationController

  before_action :authenticate!, only: [:new, :create, :destroy]

  load_and_authorize_resource

  def index
    @screencasts = @screencasts.index.page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def create
    @screencast.user = current_user

    if @screencast.save
      redirect_to @screencast
    else
      render :new, status: 422
    end
  end

  def destroy
    @screencast.destroy
    redirect_to :root, notice: t('screencast_delete.notice')
  end

  private

    def create_params
      params.require(:screencast).permit  :title,
                                          :description,
                                          :video_url
    end

end
