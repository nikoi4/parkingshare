class Feature < ApplicationRecord
  has_many :parking_lot_features
  has_many :parkings, through: :parking_lot_features

  validates :name, presence: true
  validates :icon, presence: true
end
