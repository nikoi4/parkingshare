class Parking < ApplicationRecord
  SIZE_CAR = ["Small Car", "Medium Car", "Big Car", "Truck"]
  belongs_to :user
  has_many :parking_lot_features, dependent: :destroy
  has_many :features, through: :parking_lot_features
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name }
  validates :description, length: { minimum: 20 }
  validates :size, inclusion: { in: SIZE_CAR }
  validates :price_cents, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :picture, PictureUploader
end
