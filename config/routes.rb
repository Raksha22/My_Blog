Rails.application.routes.draw do
  devise_for :admins
  resources :users
  get 'articles/search'
  get 'welcome/index'
  # get 'models/sign_in'
 root 'welcome#index'
  resources :articles do
  resources :comments
  #root to: 'home#index'
  end

 end
