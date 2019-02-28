class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :parkings
  has_many :owned_parkings, foreign_key: "user_id", class_name: "Parking", dependent: :destroy
  has_many :booked_parkings, through: :bookings, source: :parking, dependent: :destroy
  # has_many :owned_bookings, through: :parkings, source: :booking
  has_many :searches

  def owned_bookings
    bookings = []

    self.owned_parkings.each do |parking|
      parking.bookings.each do |booking|
        bookings << booking
      end
    end

    return bookings
  end
end
