class Public::StoreReviewsController < ApplicationController
  def index
    @user = EndUser.find(params[:end_user_id])
    @store_reviews = @user.store_reviews.all
  end
  
  def destroy
    @user = EndUser.find(params[:end_user_id])
    @store_review = @user.store_reviews.find(params[:id])
    @store_review.destroy
    redirect_to end_user_store_reviews_path, notice: "レビューを削除しました"
  end
end
