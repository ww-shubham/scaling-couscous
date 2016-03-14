class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    #@article = Article.new(params[:article]) -> error due to security(strong parameters)
    #requires us to tell Rails exactly which parameters are allowed into our controller actions.
    #render plain: params[:article].inspect
    @article = Article.new(params.require(:article).permit(:title, :text))
    @article.save
    redirect_to @article
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :text))
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end