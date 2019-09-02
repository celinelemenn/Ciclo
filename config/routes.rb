Rails.application.routes.draw do
  devise_for :users, :controllers  => {
             :registrations => 'registrations',
           }
  root to: 'pages#home', as: :homepage

  get '/profile', to: 'pages#profile', as: :profile
  get '/profile/:id', to: 'pages#userprofile', as: :userprofile
  get '/map', to: 'pages#map', as: :map
  get '/feed', to: 'pages#feed', as: :feed

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

  resources :conversations, only: [:index, :create, :destroy] do
      resources :messages, only: [:index, :create]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :point_of_interests, only: [ :index ]
      resources :user_positions, only: [ :create ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
