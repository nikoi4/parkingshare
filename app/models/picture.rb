class Picture < ApplicationRecord
  belongs_to :parking
  validates :picture, presence: true

  mount_uploader :picture, PictureUploader
end
