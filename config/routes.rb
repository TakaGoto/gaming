Gaming::Application.routes.draw do

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, :at => '/b'

  root :to => 'home#index'

  match '/p/about' => 'home#about', :as => :about

  match '/b' => 'home#refinery_logout'

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/p/signout' => 'sessions#destroy', :as => :signout
  match '/p/signin' => 'sessions#new', :as => :signin_facebook
  match '/p/signin_twitch' => 'sessions#new_twitch', :as => :signin_twitch

  get '/p/users' => 'users#index', :as => :users

  get ':name' => 'streams#show', :as => :stream_show
  get '/p/streams' => 'streams#index', :as => :streams
  get '/stream/:id/new' => 'streams#new', :as => :new_stream
  post '/stream/:id/new' => 'streams#create', :as => :stream
  get '/stream/:id/edit' => 'streams#edit', :as => :edit_stream
  put '/stream/:id' => 'streams#update'
  get '/p/featured_streams' => 'streams#featured_index', :as => :featured_streams

  get '/p/videos' => 'videos#index', :as => :videos
  get '/video/:id' => 'videos#show', :as => :show_video

  match '/p/contact' => 'contact#new', :as => 'contact', :via => :get
  match '/p/contact' => 'contact#create', :as => 'contact', :via => :post

end
