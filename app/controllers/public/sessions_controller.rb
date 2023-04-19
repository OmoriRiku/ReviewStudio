# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_inactive_user, only: [:create]
  before_action :is_login_redirect_back, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  ## 退会処理が行われたユーザーがログインできなくなるメソッド
  def reject_inactive_user
    @user = EndUser.find_by(email: params[:end_user][:email]) # ユーザーが入力したemailを元に@userへ特定のuser情報を渡す
    if @user.valid_password?(params[:end_user][:password]) && @user.is_active # user情報のパスワードとis_active(ステータス)がともにtrueであればログインページへ遷移する
      redirect_to new_end_user_session_path, notice: "退会しているのでログインできません"
    end
  end
end
