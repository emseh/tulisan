# frozen_string_literal: true

# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.order(title: :asc)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

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
    if @article.update(params_article)
      flash[:notice] = 'Article was edited successfully.'
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article was deleted.'
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def params_article
    params.require(:article).permit(:title, :description)
  end
end
