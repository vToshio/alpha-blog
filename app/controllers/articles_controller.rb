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

  # GET /articles/:id/edit
  def edit
    @article = Article.find(params[:id])
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

  # PATCH/PUT /articles/:id
  def update
    @article = Article.find(params[:id])

    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was edited successfully."
      redirect_to @article
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @article = Article.find(params[:id])
    @article.destroy()
    flash[:notice] = "Article was deleted successfully."
    redirect_to articles_path
  end
end
