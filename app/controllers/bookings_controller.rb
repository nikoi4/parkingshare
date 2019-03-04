class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]
  before_action :set_parking, only: [:new, :create]
  before_action :set_features, only: [:new, :show]
  def index
    @owned_bookings = current_user.owned_bookings
    @booked_bookings = current_user.bookings

    skip_policy_scope
  end

  def new
    @booking = Booking.new
    authorize @booking if @parking.user != current_user
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @parking.features.each do |feature|
      @booking.status = "approved" if feature.value
    end
    @booking.user = current_user
    @booking.parking = @parking
    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @parking = @booking.parking
    @markers = [{
      lng: @parking.longitude,
      lat: @parking.latitude,
      infoWindow: render_to_string(partial: "shared/infowindow", locals: { parking: @parking })
      }]
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:car_plate, :start_date, :end_date, :price_cents)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def set_parking
    @parking = Parking.find(params[:parking_id])
  end

  def set_features
    @features = Feature.all
  end

end
