class Review < ApplicationRecord
  belongs_to :booking

  validates :content, precense: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :date, presence: true
end
