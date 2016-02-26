Rails.application.routes.draw do

  root "users#index"
  resources :users, only: [:new, :create, :edit, :update, ]

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'

  resources :posts do
    resources :comments
  end

  get "/feed" => "pages#feed"
  get "/home" => "pages#home"
end
