class Log::PostsController < ApplicationController
  layout 'log'
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_related_posts, only: [:show, :edit]
  before_action :set_random_posts, only: [:new, :index]
  before_action :set_recent_editions, only: [:new, :show, :index, :edit]

  def index
    # TODO: pagination
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
    @post = User.find(1).posts.build(post_params)
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

    def set_related_posts
      @related_posts = @post.find_related_tags.take(3)
    end

    def set_random_posts
      # TODO: randomly select 3 posts
      @related_posts = Log::Post.all.take(3)
    end

    def set_recent_editions
      @recent_editions =  Log::Edition.last(3)
    end

    def set_post
      @post = Log::Post.find(params[:id])
    end

    def post_params
      params.require(:log_post).permit(:title, :body, :poster, :tag_list)
    end
end
