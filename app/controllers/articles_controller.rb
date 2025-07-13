class ArticlesController < ApplicationController
  # Execute before show, edit, update and destroy actions
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  # GET /articles
  def index
    @articles = Article.all.reverse
  end

  # GET /articles/:id
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/:id/edit
  def edit
  end

  # POST /articles/
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was created sucessfully."
      redirect_to @article
    else
      render "new", status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/:id
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was edited successfully."
      redirect_to @article
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy()
    flash[:notice] = "Article was deleted successfully."
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
