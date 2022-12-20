class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @review = Review.find(params[:restaurant_id])
    # raise

    if @review.destroy
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id, :user_id)
  end
end
