class Admin::UsesController < ApplicationController
  before_action :is_admin_login_authenticate, only: [:create, :edit, :update]
  before_action :set_use, only: [:edit, :update, :destroy]
  
  def index
    @use = Use.new
    @uses = Use.all
  end

  def create
    @use = Use.new(use_params)
    if @use.save
      flash[:notice] = "使用用途を登録いたしました"
      redirect_to uses_path
    else
      @uses = Use.all
      render :index
    end
  end

  def edit
  end
  
  def update
    if @use.update(use_params)
      flash[:notice] = "使用用途を更新いたしました"
      redirect_to uses_path
    else
      render :edit
    end
  end
  
  def destroy
    @use.destroy
    flash[:notice] = "使用用途を削除いたしました"
    redirect_to request.referer
  end
  
  private
  
  def set_use
    @use = Use.find(params[:id])
  end
  
  def use_params
    params.require(:use).permit(:name)
  end
end
