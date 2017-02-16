Rails.application.routes.draw do
  devise_for :user_devise_ldaps
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'

  devise_for :users
  # resources :flyers do
  #   collection do
  #     get :recent
  #   end
  # end

  post 'reporting/create' => 'reporting#create'
  get 'reporting/report' => 'reporting#report'
  post 'reporting/insert_report' => 'reporting#insert_report'

  resources :reporting
  resources :logos
  resources :categories
  resources :flyers
  resources :emails
  resources :presentations

  resources :email_requests

  root 'flyers#index'
end