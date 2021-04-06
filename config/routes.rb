Rails.application.routes.draw do

resources :users, only: [:show, :new, :edit]

resources :authors, only: [:show, :index] do
  resources :classics, only: [:show, :index, :new, :edit, :update]
end
resources :classics
resources :categories

#login & logout routes
get "/login", to: "sessions#new"
post "/login", to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
