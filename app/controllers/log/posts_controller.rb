class Log::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Log::Post.all
  end

  def show
  end

  def new
    @post = Log::Post.new
  end

  def edit
  end

  def create
    @post = Log::Post.new(post_params)
    # TODO
    # @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to log_posts_url
  end

  private

    def set_post
      @post = Log::Post.find(params[:id])
    end

    def post_params
      params.require(:log_post).permit(:title, :body, :poster, :tag_list)
    end
end
