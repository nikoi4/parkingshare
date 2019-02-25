class Parking < ApplicationRecord
  belongs_to :user
  has_many :parking_lot_features, dependent: :destroy
  has_many :features, through: :parking_lot_features
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
end
