class BookingsController < ApplicationController

def index
  @owend_bookings = current_user.owned_parkings.map { |parking| parking.bookings }
  @booked_bookings = current_user.booked_parkings.map { |parking| parking.bookings }
  raise
end

end
