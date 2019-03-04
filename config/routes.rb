Rails.application.routes.draw do

  get 'chats/index'
  post "procesar-pago", to: 'bookings#create'
  get 'reviews/create'
  devise_for :users
  get "home", to: "pages#home"
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parkings, only: [:index, :new, :create, :update, :delete] do
    resources :bookings, only: [:new, :create]
    collection do
      get 'owner_parkings'
    end

  end

  resources :bookings, only: [:index, :show, :update] do
    resources :chats, only: [:index, :create]
    resources :reviews, only: :create
  end

  resources :searches, only: :create
end
