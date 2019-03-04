class Booking < ApplicationRecord
  attr_accessor :phone_number

  belongs_to :parking
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  after_initialize :set_defaults

  private

  def set_defaults
    self.status = "Pending" if self.new_record?
  end
end
