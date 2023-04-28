# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_inactive_user, only: [:create]
  before_action :is_login_redirect_back, only: [:create]
  
  protected
  
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました"
    root_path
  end
  
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    new_end_user_session_path
  end
  
  def reject_inactive_user
    @user = EndUser.find_by(email: params[:end_user][:email])
    if @user
      if @user.valid_password?(params[:end_user][:password]) && @user.is_active
        redirect_to new_end_user_session_path, notice: "退会しているのでログインできません"
      end
    end
  end
  
end
