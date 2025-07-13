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
    @article = Article.new
  end

  # POST /articles/
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created sucessfully."
      redirect_to @article
    else
      render "new", status: :unprocessable_entity
    end
  end
end
