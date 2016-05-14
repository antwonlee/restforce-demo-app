Rails.application.routes.draw do
  devise_for :users
  root "pages#index"

  resources :accounts, only: [:index]
end
