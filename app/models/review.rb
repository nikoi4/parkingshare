class Review < ApplicationRecord
  RATING = [1, 2, 3, 4, 5]
  belongs_to :booking
  validates :content, presence: true
  validates :rating, inclusion: { in: RATING }
  validates :rating, numericality: { only_integer: true }
  validates :date, presence: true
end
