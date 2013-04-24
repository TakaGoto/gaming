Gaming::Application.routes.draw do

  root :to => 'home#index'

  match '/about' => 'home#about', :as => :about

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/p/signout' => 'sessions#destroy', :as => :signout
  match '/p/signin' => 'sessions#new', :as => :signin_facebook
  match '/p/signin_twitch' => 'sessions#new_twitch', :as => :signin_twitch

  get '/p/blog' => 'blogs#index', :as => :blog

  get '/p/users' => 'users#index', :as => :users

  get ':name' => 'streams#show', :as => :stream_show
  get '/p/streams' => 'streams#index', :as => :streams
  get '/stream/:id/new' => 'streams#new', :as => :new_stream
  post '/stream/:id/new' => 'streams#create', :as => :stream
  get '/stream/:id/edit' => 'streams#edit', :as => :edit_stream
  put '/stream/:id' => 'streams#update'
  get '/p/featured_streams' => 'streams#featured_index', :as => :featured_streams
  get '/featured/:name' => 'streams#show_featured', :as => :show_featured

  match '/p/contact' => 'contact#new', :as => 'contact', :via => :get
  match '/p/contact' => 'contact#create', :as => 'contact', :via => :post
end
