class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]
  before_action :set_parking, only: [:update, :destroy]
  def index
    @parkings = policy_scope(Parking)
  end

  def new
    @parking = Parking.new
    @features = Feature.all
    authorize @parking
  end

  def create
    @parking = Parking.new(parking_params)
    # @features = array??
    authorize @parking
    if @parking.save
      @parking_lot_features = @features.each do |feature|
        plf = ParkingLotFeatures.new
        plf.feature = feature.first
        plf.value = feature.last
        plf.parking = @parking
        plf.save
      end
      # redirect_to ...
    else
      render :new
    end
  end

  def update
  end

  def destroy
    if @parking.destroy
    # redirect_to ...
    else
      # render :
    end
  end

  private

  def parking_params
    params.require(:parking).permit(:name, :address, :picture, :size, :description, :pice_cents, :features)
  end

  def set_parking
    @parking = Parking.find(params[:id])
  end

end
