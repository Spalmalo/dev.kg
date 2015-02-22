class AsciicastsController < ApplicationController

  before_action :authenticate!

  def preview
    @asciicast = Asciicast.new preview_params
  end

  private

    def preview_params
      params.require(:asciicast).permit(:content)
    end

end