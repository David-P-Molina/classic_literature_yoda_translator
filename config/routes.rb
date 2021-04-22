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
  get 'classics/1600-1700s_classics', "classics#sorted_classics"
end


# Step 1: Make sure you understand what is asked of you
#     - if you don't understand, ask questions until you do

# Step 2: Don't code, pseudo code.
  # First, comment the challenge:
  # Add a button to the Authors page that when clicked will sort Author alphabetically
  # Second, break down challenge into smaller steps
  # add a button or link to the authors index page
  # create route for button  get '/authors/alpha' => "authors#index" routes.rb
  # determine controller and action to direct to authorscontroller
  # sort authors *** author model
  # display sorted authors authors index view

# Step 3: Code

#Challenge Create a link filter of classics written from the year 1600-1700 and display them on a page

# Step one create a link <%= link_to '1600-1700s Classics', definepathname%>
# Step two create a route within the routes.rb get 'classics/1600-1700s_classics', "classics#sorted_classics"
#step two.5 I need to add an action 


# #controller
# def sorted
#   @classic = Classic.all.sorted
# end

# #models
# def sorted_classics(classic)
#   if classic.release_date < 1700 && classic.release_date > 1600
#     @classic = classic#to use in view 
#   end
# end
# # step three is to class
# # step four layer the two scopes
# Book to look up
# algorithms to live by