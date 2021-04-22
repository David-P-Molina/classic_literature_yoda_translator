Rails.application.routes.draw do

  root 'welcome#home'
  
  get 'classics/oldest_classic', to: 'classics#oldest_classic'
  get 'classics/newest_classic', to: 'classics#newest_classic'

  resources :authors, only: [:show, :index, :new, :create, :edit, :update] do
    resources :classics, only: [:show, :index, :new, :create, :edit, :update]
  end
  resources :classics
  resources :categories, only: [:show, :index]

  #login & logout routes
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#facebook_login" 

end
