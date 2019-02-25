class Feature < ApplicationRecord
  has_many :parking_lot_features
  has_many :parkings, through: :parking_lot_features
end
