class Public::EndUsersController < ApplicationController
  before_action :set_user,          only: [:show, :edit, :update, :unsubscribe, :withdraw]
  before_action :ensure_guest_user, only: [:edit, :unsubscribe]
  before_action :ensure_user_admin, only: [:edit, :unsubscribe]
  
  def index
    @users = EndUser.all
  end
    
  def show
  end
  
  def edit
  end
  
  def update
    @user.update(user_params)
    redirect_to end_user_path(@user)
  end
  
  def unsubscribe
  end
  
  def withdraw
    @user.update(is_active: true)
    reset_session
    redirect_to root_path, notice: "退会いたしました。"
  end
  
  private
  
  def ensure_guest_user
    @user = EndUser.find(params[:id])
    if @user.name == "guestuser"
      redirect_to end_user_path(current_end_user), notice: 'ゲストユーザーは編集できません'
    end
  end
  
  def ensure_user_admin
    @user = EndUser.find(params[:id])
    unless @user == current_end_user || admin_signed_in?
      redirect_to end_user_path(@user), notice: "他のユーザーの編集はできません。"
    end
  end
  
  def set_user
    @user = EndUser.find(params[:id])
  end
  
  def user_params
    params.require(:end_user).permit(:name, :profile_image, :is_active)
  end
end
