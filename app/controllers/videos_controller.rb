class VideosController < ApplicationController
  def index
    @videos = Video.for_user(current_user).index.includes(:user).page(params[:page]).per(10)
  end
end