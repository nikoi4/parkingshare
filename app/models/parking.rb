class Parking < ApplicationRecord
  SIZE_CAR = ["Small Car", "Medium Car", "Big Car", "Truck"]
  belongs_to :user
  has_many :parking_lot_features, dependent: :destroy
  has_many :features, through: :parking_lot_features
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
  validates :name, presence: true
  validates :address, presence: true, uniqueness: { scope: :name }
  validates :description, length: { minimum: 20 }
  validates :size, inclusion: { in: SIZE_CAR }
  validates :price_cents, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def includes_feature?(feature)
    self.parking_lot_features.map { |plf| plf.feature.id }.include?(feature.id)
  end

  def reviews
    self.bookings.map { |booking| booking.reviews }.flatten
  end

  def rating
    self.reviews.map { |review| review.rating }.sum / self.reviews.count.ceil
  end

  def self.available(search_start, search_end, location)
    return nil if search_start <= search_end || location.empty?

    booked = self.includes(:bookings).near(location, 5).where("(?, ?) OVERLAPS (bookings.start_date, bookings.end_date)", start_date, end_date)
    booked_ids = booked.map { |parking| parking.id }
    raise
    self.near(location, 5).where.not(id: booked_ids)
  end

end
