Rails.application.routes.draw do
  
  resources :credit_purchases
  resources :cash_purchases
  resources :accounts
  devise_for :users

  authenticated :user do
  	root 'lists#index', as: "authenticated_root"
  end

  root 'lists#welcome'

  resources :lists do
  	resources :reviews, except: [:show, :index]
  end
  
  get '/index' => 'lists#index'
  get '/welcome' => 'lists#welcome'

end
