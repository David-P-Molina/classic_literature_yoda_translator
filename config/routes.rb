Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get 'users/show'
resources :authors
resources :categories
resources :classics

#login & logout routes
get "/login", to: "sessions#new"
post "/login", to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
