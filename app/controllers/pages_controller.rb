# frozen_string_literal: true

# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def home; end

  def about; end

  def hello
    render plain: 'hello'
  end
end
