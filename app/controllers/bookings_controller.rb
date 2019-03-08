class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]
  before_action :set_parking, only: [:new, :create]
  before_action :set_features, only: [:new, :show]
  def index
    @owned_bookings = current_user.owned_bookings.sort_by { |booking| booking.updated_at }.reverse
    @booked_bookings = current_user.bookings.sort_by { |booking| booking.updated_at }.reverse

    skip_policy_scope
  end

  def new
    @booking = Booking.new(search_params)
    @booking.parking = @parking
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @parking.features.each do |feature|
      @booking.status = "approved" if feature.name == 'instant'
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
    @chats = Chat.where(booking: @booking)
    @chat = Chat.new
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

  def approve_transaction
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "approved"
    if @booking.save
      transaction_notify_pusher(@booking)
      respond_to do |format|
        format.html { redirect_to @booking }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :show }
        format.js
      end
    end
  end

  def decline_transaction
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "declined"
    if @booking.save
      transaction_notify_pusher(@booking)
      respond_to do |format|
        format.html { redirect_to @booking }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :show }
        format.js
      end
    end
  end

  private

  def transaction_notify_pusher(booking)
    Pusher.trigger('booking', 'transaction', booking.as_json)
  end

  def booking_params
    params.require(:booking).permit(:car_plate, :start_date, :end_date, :price_cents, :phone_number)
  end

  def search_params
    params.permit(:start_date, :end_date, :parking_id)
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
