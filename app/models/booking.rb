class Booking < ApplicationRecord
  attr_accessor :phone_number

  belongs_to :parking
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :chats
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  after_initialize :set_defaults
  after_create :notify_pusher, on: :create

  private

  def notify_pusher
    Pusher.trigger('booking', 'new', {parking_owner_id: self.parking.user.id, booking_amount: self.parking.user.owned_bookings.count}.as_json)
  end

  def set_defaults
    self.status = "Pending" if self.new_record?
  end
end
