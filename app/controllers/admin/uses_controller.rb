class Admin::UsesController < ApplicationController
  before_action :is_admin_login_authenticate, only: [:create, :edit, :update]
  before_action :set_use, only: [:edit, :update]
  
  def index
    @use = Use.new
    @uses = Use.all
  end

  def create
    @use = Use.new(use_params)
    if @use.save
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
      redirect_to uses_path
    else
      render :edit
    end
  end
  
  private
  
  def set_use
    @use = Use.find(params[:id])
  end
  
  def use_params
    params.require(:use).permit(:name)
  end
end
