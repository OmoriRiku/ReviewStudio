class Admin::StudioReviewsController < ApplicationController
  before_action :authenticate_end_user!, only: [:new, :create]
  
  def new
    @studio = Studio.find(params[:studio_id])
    @studio_review = StudioReview.new
  end
  
  def create
    @studio = Studio.find(params[:studio_id])
    @studio_review = StudioReview.new(studio_review_params)
    @studio_review.end_user_id = current_end_user.id
    @studio_review.studio_id = @studio.id
    if @studio_review.save
      flash[:notice] = 'レビューを投稿しました'
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def destroy
    @studio = Studio.find(params[:studio_id])
    @studio_review = @studio.studio_reviews.find(params[:id])
    if @studio_review.destroy
      flash[:notice] = 'レビューを削除しました'
      redirect_to studio_path(@studio)
    end
  end
  
  private
  
  def studio_review_params
    params.require(:studio_review).permit(:studio_id, :rate, :number_studio, :comment)
  end
end
