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

  def self.available(start_date, end_date, location)
    return nil if end_date <= start_date || location.empty?

    sd = start_date.to_datetime.strftime("%e-%m-%y %H:%M")
    ed = end_date.to_datetime.strftime("%e-%m-%y %H:%M")
    booked = self.includes(:bookings).where.not(bookings: { car_plate: "" }).where("(?, ?) OVERLAPS (bookings.start_date, bookings.end_date)", sd, ed).near(location, 50)
    booked_ids = booked.map { |parking| parking.id }
    self.near(location, 50).where.not(id: booked_ids)
  end

end
