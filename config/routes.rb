Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'

  devise_for :users
  # resources :flyers do
  #   collection do
  #     get :recent
  #   end
  # end
  resources :logos
  resources :categories
  resources :flyers
  resources :emails
  resources :presentations

  resources :email_requests

  root 'flyers#index'
end