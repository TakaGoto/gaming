Gaming::Application.routes.draw do

  root :to => 'home#index'

  match '/about' => 'home#about', :as => :about

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin_facebook

  get '/blog' => 'blogs#index', :as => :blog

  get '/users' => 'users#index', :as => :users

  get 'stream/:id' => 'streams#show', :as => :stream_show
  get '/streams' => 'streams#index', :as => :streams
  get '/stream/:id/new' => 'streams#new', :as => :new_stream
  post '/stream/:id/new' => 'streams#create', :as => :stream
  get '/stream/:id/edit' => 'streams#edit', :as => :edit_stream
  put '/stream/:id' => 'streams#update'

  match '/contact' => 'contact#new', :as => 'contact', :via => :get
  match '/contact' => 'contact#create', :as => 'contact', :via => :post
end
