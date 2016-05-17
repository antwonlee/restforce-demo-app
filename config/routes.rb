Rails.application.routes.draw do
  devise_for :users
  root "pages#index"

  resources :accounts

  post "/account", to: "accounts#update"
end
