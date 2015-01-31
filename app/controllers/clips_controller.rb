class ClipsController < ApplicationController

  load_and_authorize_resource

  def index
    @clips = @clips.index.page(params[:page]).per(10)
  end

  def show
  end

end
