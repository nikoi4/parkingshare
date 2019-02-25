class Booking < ApplicationRecord
  belongs_to :parking
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :status, precense: true
  validates :start_date, precense: true
  validates :end_date, precense: true

  after_initialize :set_defaults

  private

  def set_defaults
    self.description = "Pending" if self.new_record?
  end
end
