class ScreencastsController < ApplicationController

  before_action :authenticate!, except: [:show, :index]

  load_and_authorize_resource

  before_action :build_asciicast, only: [:new, :edit]

  def index
    @screencasts = @screencasts.index.includes(:user).page(params[:page]).per(10)
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
      build_asciicast
      render :new, status: 422
    end
  end

  def destroy
    @screencast.destroy
    redirect_to :root, notice: t('screencast_delete.notice')
  end

  def edit
  end

  def update
    if @screencast.update screencast_params
      redirect_to @screencast, notice: t('screencast_update.notice')
    else
      build_asciicast
      render :edit, status: 422
    end
  end

  private

    def screencast_params
      params.require(:screencast).permit  :title,
                                          :description,
                                          :video_url,
                                          references_attributes:  [:title, :url, :_destroy, :id],
                                          snippets_attributes:    [:description, :code, :language, :_destroy, :id],
                                          asciicast_attributes:   [:content, :_destroy, :id]
    end

    def build_asciicast
      @screencast.build_asciicast unless @screencast.asciicast.present?
    end

end
