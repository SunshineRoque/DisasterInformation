Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  resources :disasters, except: :show

  resources :posts do
    resources :comments, except: :show
  end

  namespace :user do
    resources :posts
  end

  namespace :user do
    resources :comments
  end
end
