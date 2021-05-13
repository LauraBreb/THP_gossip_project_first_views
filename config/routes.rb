Rails.application.routes.draw do
  resources :users
  resources :gossips
  resources :cities, only: [:show]
  resources :sessions
  resources :likes, only: [:create, :destroy]

  get "/team", to: "static#team"
  get "/contact", to: "static#contact"
  get "/welcome/:first_name", to: "static#welcome"
  get "/author/:first_name", to:"static#show_author"

end

