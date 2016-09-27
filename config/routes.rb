Rails.application.routes.draw do
  devise_for :users
  resources :flyers

  root 'flyers#index'
end
