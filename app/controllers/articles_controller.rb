class ArticlesController < ApplicationController
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
    @article = Article.new(params_article)
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_article
    params.require(:article).permit(:title, :description)
  end
end
