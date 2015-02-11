class ClipsController < ApplicationController

  before_action :authenticate!, except: [:show, :index]

  load_and_authorize_resource

  def index
    @clips = @clips.index.includes(:user).page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def create
    @clip.user = current_user

    if @clip.save
      redirect_to @clip
    else
      render :new, status: 422
    end
  end

  def destroy
    @clip.destroy
    redirect_to :clips, notice: t('clip_delete.notice')
  end

  def edit
  end

  def update
    if @clip.update clip_params
      redirect_to @clip, notice: t('clip_update.notice')
    else
      render :edit, status: 422
    end
  end

  private

    def clip_params
      params.require(:clip).permit  :title,
                                    :description,
                                    :video_url,
                                    references_attributes:  [:title, :url, :_destroy, :id]
    end

end
