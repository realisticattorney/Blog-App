Rails.application.routes.draw do # this is calling the index action (def index) within  articles controller (a class I should define with its index action) FOR THAT GO TO CONTROLLERS/ARTICLES
  get "/articles", to: "articles#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end




Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
