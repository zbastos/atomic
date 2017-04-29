class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # TODO
    # @post = current_user.posts.build(post_params)
    @article = Article.new(article_params)

    if @article.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :image, :tag_list, :category_list)
    end
end