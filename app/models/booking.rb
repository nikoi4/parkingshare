class Booking < ApplicationRecord
  belongs_to :parking
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
