class Admin::StudioReviewsController < ApplicationController
  def new
    @studio = Studio.find(params[:studio_id])
    @studio_review = StudioReview.new
  end
  
  def create
    @studio = Studio.find(params[:studio_id])
    @studio_review = StudioReview.new(studio_review_params)
    @studio_review.end_user_id = current_end_user.id
    @studio_review.studio_id = @studio.id
    @studio_review.save
    redirect_to studio_path(@studio)
  end
  
  def destroy
    @studio = Studio.find(params[:studio_id])
    @studio_review = @studio.studio_reviews.find(params[:id])
    @studio_review.destroy
    redirect_to studio_path(@studio)
  end
  
  private
  
  def studio_review_params
    params.require(:studio_review).permit(:studio_id, :use_id, :rate, :number_studio, :comment)
  end
end
