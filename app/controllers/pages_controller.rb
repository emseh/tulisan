class PagesController < ApplicationController
  def home
  end

  def about
  end

  def hello
    render plain: 'hello'
  end
end
