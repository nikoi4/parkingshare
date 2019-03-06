class Search < ApplicationRecord
  attr_accessor :feature_ids
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
