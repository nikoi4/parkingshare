class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_parking, only: [:update, :destroy]

  def index
    @dates = [params[:starting], params[:ending]]
<<<<<<< HEAD
    @lat_long = params[:lat_long]
    @parkings = Parking.available(@dates.first, @dates.last, @lat_long)
=======
    @feature_ids = params[:feature_ids]
    @parkings = policy_scope(Parking).where("features.id = ?", params[:feature_ids])
>>>>>>> 3bc869f64d6fd8d2dd1f320f6e456333fceb2494
    raise
    @parkings = policy_scope(Parking).near(params[:lat_long], 50)
    @features = Feature.all
    @search = Search.new
    @markers = @parkings.map do |parking|
      {
        lng: parking.longitude,
        lat: parking.latitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { parking: parking }),
        # id: parking.id
      }
    end
  end

  def new
    @parking = Parking.new
    @parking.pictures.build
    authorize @parking
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user = current_user
    authorize @parking
    if @parking.save
      assign_features
      redirect_to parkings_path
    else
      render :new
    end
  end

  def owner_parkings
    @parkings = authorize current_user.owned_parkings.where.not(latitude: nil, longitude: nil)
    @features = Feature.all
    @markers = @parkings.map do |parking|
      {
        lng: parking.longitude,
        lat: parking.latitude
      }
    end
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
    params.require(:parking).permit(:name, :address, :size, :description, :price_cents, pictures_attributes: [:picture], feature_ids: [])
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
