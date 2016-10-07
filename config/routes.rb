Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  resources :flyers do
    collection do
      get :recent
    end
  end
  resources :logos
  resources :categories

  root 'welcome#index'
end
