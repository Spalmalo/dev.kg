class PostsController < ApplicationController

  before_action :authenticate!, except: [:show, :index]
  load_and_authorize_resource

  def index
    @posts = @posts.for_user(current_user).index.includes(:user).page(params[:page]).per(10)
  end

  def show
  end

  def new
  end

  def create
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render :new, status: 422
    end
  end

  def publish
    @post = Post.find(params[:post_id])
    authorize! :publish, @post
    @post.publish!
    redirect_to @post, notice: t('post.notices.published')
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: t('post_update.notice')
    else
      render :edit, status: 422
    end
  end

  def destroy
    @post.destroy
    redirect_to :posts, notice: t('post_delete.notice')
  end

  private

    def post_params
      params.require(:post).permit  :title,
                                    :description
    end

end
