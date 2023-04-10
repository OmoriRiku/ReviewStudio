class Admin::StoreReviewsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
    @store_review = StoreReview.new
  end
  
  def create
    @store = Store.find(params[:store_id])
    @store_review = StoreReview.new(store_review_params)
    @store_review.end_user_id = current_end_user.id
    @store_review.store_id = @store.id
    @store_review.save
    redirect_to store_path(@store)
  end
  
  def destroy
    @store = Store.find(params[:store_id])
    @store_review = @store.store_reviews.find(params[:id])
    @store_review.destroy
    redirect_to store_path(@store)
  end
  
  private
  
  def store_review_params
    params.require(:store_review).permit(:rate,:comment)
  end
end
