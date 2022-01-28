Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'hello', to: 'pages#hello'
  resources :articles, only: %i[index create new show]
end
