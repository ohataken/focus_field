Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :sessions, only: [:show, :new, :create, :destroy]

  root 'sessions#show'
end
