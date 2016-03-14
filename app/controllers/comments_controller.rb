class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params.require(:comment).permit(:name, :comment, :rating))
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article
  end

  def show
    @article = Article.find(params[:article_id])
    redirect_to @article
  end

end