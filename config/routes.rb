Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home', as: :homepage
  resources :users, only: [:show]

  get '/profile', to: 'pages#profile', as: :profile

  get '/map', to: 'pages#map', as: :map

  resources :point_of_interests, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
    resources :downvotes, only: [:create]
    resources :reports, only: [:new, :create]
    resources :bookmarks, only: [:create]
  end

  resources :conversations, only: [:index, :create, :destroy] do
      resources :messages, only: [:index, :create]

    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
