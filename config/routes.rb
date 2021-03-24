Rails.application.routes.draw do
  get 'classic/index'
  get 'classic/new'
  get 'classic/edit'
  get 'classic/show'
  get 'categories/index'
  get 'categories/new'
  get 'categories/edit'
  get 'categories/show'
  get 'authors/index'
  get 'authors/new'
  get 'authors/edit'
  get 'authors/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
