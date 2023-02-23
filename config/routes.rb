Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #get "/", to: "main#index"
   # Defines the root path route ("/")
  root "main#index"

  resources :articles, param: :slug

  resources :users

  resources :profiles, only: [:new, :index, :create, :show]

  resources :sessions, only: [:create, :new]
end
