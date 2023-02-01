Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/", to: "main#index"

  resources :articles, param: :slug

  resources :users

  resources :profiles, only: [:new, :index]
end
