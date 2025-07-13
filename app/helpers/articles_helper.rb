module ArticlesHelper
  def show_article_created_at(article)
    article.created_at.strftime("%d/%m/%Y %H:%M:%S")
  end
end
