class ArticlesController < ApplicationController
  def index
    @articles = Article.order(title: :asc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
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

  def update
    @article = Article.find(params[:id])
    if @article.update(params_article)
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = 'Article was deleted.'
    redirect_to articles_path, status: :see_other
  end

  private

  def params_article
    params.require(:article).permit(:title, :description)
  end
end
