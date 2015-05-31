class BaseVideosController < ApplicationController

  before_action :authenticate!, except: [:show, :index]
  before_action :fetch_video, only: :publish

  load_and_authorize_resource
  skip_load_resource only: :publish

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def publish
    authorize! :publish, @video
    @video.publish!
    redirect_to @video, notice: t('video.notices.published')
  end

  protected

    def fetch_video
      @video = Video.find params.fetch :screencast_id, params[:clip_id]
    end

end
