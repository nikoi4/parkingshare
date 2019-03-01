class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    authorize @review if @booking.user == current_user && @booking.reviews.first.nil?
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    @review.date = Date.today
    authorize @review
    if @review.save
      redirect_to @booking
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:picture, :rating, :content)
  end
end
