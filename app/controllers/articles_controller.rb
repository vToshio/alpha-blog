class ArticlesController < ApplicationController
  # GET /articles
  def index
    @articles = Article.all.reverse
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
  end

  # POST /articles/
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    redirect_to @article
  end
end
