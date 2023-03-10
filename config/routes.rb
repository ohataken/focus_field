Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :sessions, only: [:show, :new, :create, :destroy]
  resources :cards, only: [:index, :new, :create, :show, :edit, :update] do
    resource :card_finishes, only: [:create], path: "finishes"
    resource :card_images, only: [:show], path: "image"
    resource :card_sessions, only: [:create, :destroy], path: "session"
    resources :child_cards, only: [:index, :new, :create, :show, :edit, :update], path: "cards"
  end

  namespace :api do
    resources :cards, only: [:index, :create, :show, :update, :destroy] do
      resource :card_finishes, only: [:create], path: "finishes"
      resource :card_images, only: [:show], path: "image"
      resource :card_sessions, only: [:create, :show, :destroy], path: "session"
      resources :child_cards, only: [:index, :new, :create, :show, :edit, :update], path: "cards"
    end
  end

  root 'sessions#show'
end
