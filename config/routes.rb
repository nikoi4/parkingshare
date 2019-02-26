Rails.application.routes.draw do
  devise_for :users
  root to: 'parkings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :parkings, only: [:index, :new, :create, :edit, :update, :delete] do
    resources :bookings, only: [:create]
    resources :parking_lot_features, only: [:create, :update]
  end

  resources :bookings, only: [:index, :show, :update] do
    resources :reviews, only: :create
  end
end
