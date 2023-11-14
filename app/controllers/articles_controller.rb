class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # Save data from form input
    @article.save
    # redirect_to to details page
    redirect_to article_path(@article)
  end

  def edit
    @article = set_article
  end

  def update
    @article = set_article
    @article.update(article_params)
    # No need for app/views/Task/update.html.erb
    redirect_to article_path(@article)
  end

  def destroy
    @article = set_article
    @article.destroy
    # No need for app/views/Task/destroy.html.erb
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
