class Admin::StoreReviewsController < ApplicationController
  before_action :authenticate_end_user!, only: [:new, :create]
  
  def new
    @store = Store.find(params[:store_id])
    @store_review = StoreReview.new
  end
  
  def create
    @store = Store.find(params[:store_id])
    @store_review = StoreReview.new(store_review_params)
    @store_review.end_user_id = current_end_user.id
    @store_review.store_id = @store.id
    if @store_review.save
      flash[:notice] = 'レビューを投稿しました'
      redirect_to store_path(@store)
    else
      render :new
    end
  end
  
  def destroy
    @store = Store.find(params[:store_id])
    @store_review = @store.store_reviews.find(params[:id])
    @store_review.destroy
    flash[:notice] = 'レビューを削除しました'
    redirect_to store_path(@store)
  end
  
  private
  
  def store_review_params
    params.require(:store_review).permit(:rate,:comment)
  end
end
