class Picture < ApplicationRecord
  belongs_to :parking
  mount_uploader :picture, PictureUploader

  validates :picture, presence: true
end
