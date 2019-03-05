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
  has_many :chats
  validates :first_name, presence: true
  validates :last_name, presence: true

  def owned_bookings
    bookings = []

    self.owned_parkings.each do |parking|
      parking.bookings.each do |booking|
        bookings << booking
      end
    end

    return bookings
  end

  def identifier
    if first_name
      first_name
    else
      email
    end
  end

  def identifierfull
    if (first_name && last_name).nil?
      email
    else
      return "#{first_name.capitalize} #{last_name.capitalize}"
    end
  end
end
