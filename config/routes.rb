Rails.application.routes.draw do
root "pages#home"
  get 'about', to: 'pages#about'
  get 'hello', to: 'pages#hello'
  resources :articles, only: [:show, :index, :new, :create]
end
