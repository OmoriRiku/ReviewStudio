class Admin::StudiosController < ApplicationController
  before_action :is_admin_login_authenticate,             only: [:new, :create, :edit, :update, :destroy]
  before_action :set_studio,                              only: [:show, :edit, :update, :destroy]
  before_action :sort_studio_review,                      only: [:show]
  
  def new
    @studio = Studio.new
  end
  
  def create
    @studio = Studio.new(studio_params)
    if @studio.save
      flash[:notice] = 'スタジオを新規登録いたしました！'
      redirect_to studio_path(@studio.id)
    else
      render :new
    end
  end

  def index
    @studios = Studio.all
  end

  def show
  end

  def edit
  end
  
  def update
    if @studio.update(studio_params)
      flash[:notice] = 'スタジオを更新しました！'
      redirect_to studio_path(@studio)
    else
      render :edit
    end
  end
  
  def destroy
    @studio.destroy
    flash[:notice] = 'スタジオを削除しました'
    redirect_to studios_path
  end
  
  def associated_result_studio
    @word = params[:word]
    @studio_ids = params[:studio_id]
    @sort = params[:sort]
    @result = Studio.associated_studios(@studio_ids, @sort)
  end
  
  private
  
  def sort_studio_review
    sort_studio_review = params[:sort_studio_review]
    @sort_studio_review = @studio.studio_reviews.order(sort_studio_review)
  end
  
  def set_studio
    @studio = Studio.find(params[:id])
  end
  
  def studio_params
    params.require(:studio).permit(:use_id, :store_id, :name, :introduction, :personal_price, :three_price, :more_price, :studio_image)
  end
end
