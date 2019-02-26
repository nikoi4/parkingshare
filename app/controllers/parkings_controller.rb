class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]
  before_action :set_parking, only: [:create, :update, :destroy]
  def index
    @parkings = policy_scope(Parking)
  end

  def new
    @parking = Parking.new
    @features = Feature.all
    authorize @parking
  end

  def create
    authorize @parking
  end

  def update
  end

  def destroy
  end

  private

  def parking_params
    params.require(:parking).permit(:name, :address, :picture, :size, :description, :pice_cents)
  end

  def set_parking
    @parking = Parking.find(params[:id])
  end

end
