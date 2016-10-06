Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  resources :flyers
  resources :logos
  resources :categories

  root 'welcome#index'
end
