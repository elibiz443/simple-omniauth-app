Rails.application.routes.draw do
  get "auth/:provider/callback", to: "sessions#create"
  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  get "dashboard", to: "home#index"

  root "home#index"
end
