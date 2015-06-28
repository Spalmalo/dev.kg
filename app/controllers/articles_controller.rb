class ArticlesController < ApplicationController

  before_action :authenticate!

  def preview
    @article = Article.new preview_params
    @article.render_content
  end

  private

    def preview_params
      params.require(:article).permit(:content)
    end

end