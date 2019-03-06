Rails.application.routes.draw do

  get 'profile', to: 'pages#profile', as: 'profile'
  get 'chats/index'
  post "procesar-pago", to: 'bookings#create'
  get 'reviews/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
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
    get "approve_transaction", to: "bookings#approve_transaction", as: :approve_transaction
    get "decline_transaction", to: "bookings#decline_transaction", as: :decline_transaction
    resources :chats, only: [:index, :create]
    resources :reviews, only: :create
  end

  resources :searches, only: :create

end
