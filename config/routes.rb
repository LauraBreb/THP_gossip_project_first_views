Rails.application.routes.draw do

  resources :gossips

  resources :cities, only: [:show]

  get "/team", to: "static#team"
  get "/contact", to: "static#contact"
  get "/welcome/:first_name", to: "static#welcome"
  get "/author/:first_name", to:"static#show_author"

end

