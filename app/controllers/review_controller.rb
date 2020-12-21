class ReviewController < ApplicationController
  def new
    if current_user
      @store = Store.find(params[:store_id])
    else
      flash[:notice] = "Must be logged in to leave a review. Please register or login to leave a review."
      redirect_to request.referrer
    end
  end

  def create
    review = current_user.reviews.create(review_params)
    flash[:notice] = "Review successfully created."
    redirect_to "/store/#{params[:store_id]}"
  end

  def destroy
    current_user.reviews.delete(params[:review_id])
    flash[:notice] = "Review successfully deleted."
    redirect_to request.referrer
  end

  private
  def review_params
    params.permit(:comment, :rating, :store_id)
  end
end
