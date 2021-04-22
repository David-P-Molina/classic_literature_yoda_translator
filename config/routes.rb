Rails.application.routes.draw do
  root 'welcome#home'
  
  resources :authors, only: [:show, :index, :new, :create, :edit, :update] do
    resources :classics, only: [:show, :index, :new, :create, :edit, :update]
  end
  resources :classics
  resources :categories, only: [:show, :index]
  
 
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/auth/facebook/callback", to: "sessions#facebook_login" 
  get "/logout", to: "sessions#destroy"
  
    get 'classics/ancient_classic', to: 'classics#oldest_classic'
    get 'classics/modern_classic', to: 'classics#newest_classic'
  
end
