class ArticlesController < ApplicationController
  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end
end
