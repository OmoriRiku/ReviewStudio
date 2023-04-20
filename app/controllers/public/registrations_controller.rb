# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  ## deviseのストロングパラメーター用の記述
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :is_login_redirect_back, only: [:create]
  
  protected
  
  #  新規登録時にユーザー名とユーザーの写真を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
  end
end
