Rails.application.routes.draw do

  get 'welcome/home'
  resources :users

  resources :authors, only: [:show, :index, :new, :create, :edit, :update] do
    resources :classics, only: [:show, :index, :new, :edit, :update]
  end
  resources :classics
  resources :categories

  #login & logout routes
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  get "/auth/facebook/callback", to: "sessions#facebook_login" 


  #root 'welcome#home' add controller and views
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
