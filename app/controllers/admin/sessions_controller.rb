# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :is_login_redirect_back, only: [:new, :create]
  
  protected
  
  def after_sign_in_path_for(resource)
    flash[:notice] = "管理者でログインしました"
    end_users_path
  end
  
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    new_admin_session_path
  end
end
