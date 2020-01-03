class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    if(current_user.articles.create(article_params).valid?)
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
    def article_params
      params.require(:article).permit(:title,:text)
    end
end
