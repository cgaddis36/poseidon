class ReviewController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
  end

  def create
    review = current_user.reviews.create(review_params)
    flash[:notice] = "Review successfully created."
    redirect_to "/store/#{params[:store_id]}"
  end

  private
  def review_params
    params.permit(:comment, :rating, :store_id)
  end
end
