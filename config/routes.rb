Rails.application.routes.draw do
  resources :flyers

  root 'flyers#index'
end
