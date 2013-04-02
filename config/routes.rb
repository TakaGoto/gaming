Gaming::Application.routes.draw do

  root :to => 'home#index'

  match '/about' => 'home#about', :as => :about

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin_facebook

  get '/blog' => 'blogs#index', :as => :blog

  match '/contact' => 'contact#new', :as => 'contact', :via => :get
  match '/contact' => 'contact#create', :as => 'contact', :via => :post
end
