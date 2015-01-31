class ClipsController < ApplicationController

  before_action :authenticate!, only: [:new, :create, :destroy]

  load_and_authorize_resource

  def index
    @clips = @clips.index.page(params[:page]).per(10)
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

  private

    def create_params
      params.require(:clip).permit  :title,
                                    :description,
                                    :video_url
    end

end
