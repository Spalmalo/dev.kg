class PagesController < ApplicationController

  load_and_authorize_resource

  def show
  end

  def new
  end

  def create
    if @page.save
      redirect_to @page
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if @page.update page_params
      redirect_to @page, notice: t('page_update.notice')
    else
      render :edit, status: 422
    end
  end

  def destroy
    @page.destroy
    redirect_to :root, notice: t('page_delete.notice')
  end

  private

    def page_params
      params.require(:page).permit  :title,
                                    :content
    end

end
