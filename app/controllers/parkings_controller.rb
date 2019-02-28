class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]
  before_action :set_parking, only: [:update, :destroy]

  def index
    @parkings = policy_scope(Parking)
  end

  def new
    @parking = Parking.new
    authorize @parking
  end

  def create
    # binding.pry
    @parking = Parking.new(parking_params)
    @parking.user = current_user
    authorize @parking
    @parking.save

    assign_features
  end

  def update
    @parking.update(parking_params)
    #getting parking_lot_features instances to update it
    @parking.parking_lot_features.destroy
    assign_features
    if @parking.save
      # redirect_to dashboard
    else
      # render :dashboard
    end
  end

  def destroy
    @parking.destroy
    redirect_to root_path
  end

  private

  def parking_params
    params.require(:parking).permit(:name, :address, :size, :description, :price_cents, { pictures: [] }, feature_ids: [])
  end

  def set_parking
    @parking = Parking.find(params[:id])
    authorize @parking
  end

  def assign_features
    @features = parking_params[:feature_ids]
    @features.each do |feature_id|
      ParkingLotFeature.create(feature_id: feature_id.to_i, parking: @parking)
    end
  end
end
