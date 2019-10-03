Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers  => {:registrations => 'registrations'}

  root to: 'pages#home', as: :homepage
  get '/profile', to: 'pages#profile', as: :profile
  get '/profile/:id', to: 'pages#userprofile', as: :userprofile
  get '/map', to: 'pages#map', as: :map
  get '/feed', to: 'pages#feed', as: :feed
  get '/filter/:id', to: 'preferences#edit', as: :preferencesedit
  patch '/filter/:id', to: 'preferences#update', as: :preferences
  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_error"
  get "/help", to: 'pages#help', as: :help
  get "/terms-of-services", to: 'pages#terms', as: :terms


  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #     resources :comments, only: [:create]
  #   end

  resources :trips, only: [:new, :create]
  resources :point_of_interests, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
    resources :downvotes, only: [:create]
    resources :reports, only: [:new, :create]
    resources :bookmarks, only: [:create]
  end

  resources :conversations, only: [:index, :show, :create, :destroy] do
      resources :personal_messages, only: [:new, :create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :point_of_interests, only: [ :index ]
      resources :user_positions, only: [ :create ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
