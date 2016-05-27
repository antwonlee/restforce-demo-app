Rails.application.routes.draw do
  devise_for :users
  root "pages#index"

  resources :accounts
  resources :contacts

  post "/account", to: "accounts#update"
  post "/contact", to: "contacts#update"
end
