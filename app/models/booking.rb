class Booking < ApplicationRecord
  belongs_to :parking
  belongs_to :user
end
