Rails.application.routes.draw do

  get "/", to:"static#index", as: 'root'
  get "/team", to: "static#team"
  get "/contact", to: "static#contact"
  get "/welcome/:first_name", to: "static#welcome"
  get "/:id", to:"static#show_gossip", as: 'show_gossip'
  get "/author/:first_name", to:"static#show_author"

end

