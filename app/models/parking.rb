class Parking < ApplicationRecord
  belongs_to :user
  has_many :parking_lot_features, dependent: :destroy
  has_many :features, through: :parking_lot_features
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings

  validates :name, precense: true
  validates :address, precense: true, uniqueness: { scope: :name }
  validates :picture, precense: true
  validates :description, length: { minimum: 20 }
  validates :size, inclusion: { in: ["Small Car", "Medium Car", "Big Car", "Truck"] }
  validates :price_cents, precense: true
end
