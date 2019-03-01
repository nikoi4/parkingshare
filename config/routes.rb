Rails.application.routes.draw do
  get 'reviews/create'
  devise_for :users
  get "home", to: "pages#home"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parkings, only: [:index, :new, :create, :update, :delete] do
    resources :bookings, only: [:new, :create]
    resources :parking_lot_features, only: [:create, :update]
  end

  resources :bookings, only: [:index, :show, :update] do
    resources :reviews, only: :create
  end

  resources :searches, only: :create
end
