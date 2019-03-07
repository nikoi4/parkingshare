class SearchesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @search = Search.new(search_params)
    default = Geocoder.search('Serrano, Buenos Aires')
    @search.address = default.first.address if @search.address == ""
    @search.user = current_user if user_signed_in?
    authorize @search
    @search.save
    redirect_to parkings_path(
      address: search_params[:address],
      starting: search_params[:starting],
      ending: search_params[:ending],
      lat_long: [@search.latitude, @search.longitude],
      feature_ids: search_params[:feature_ids]
    )
  end

  private

  def search_params
    params.require(:search).permit(:address, :starting, :ending, feature_ids: [])
  end
end
