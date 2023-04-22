class Public::StudioReviewsController < ApplicationController
  def index
    @user = EndUser.find(params[:end_user_id])
    @studio_reviews = @user.studio_reviews.all
  end
  
  def destroy
    @user = EndUser.find(params[:end_user_id])
    studio_review = @user.studio_reviews.find(params[:id])
    studio_review.destroy
    redirect_to request.referer, notice: "レビューを削除しました"
  end
end
