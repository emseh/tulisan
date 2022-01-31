# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'hello', to: 'pages#hello'
  resources :articles
end
