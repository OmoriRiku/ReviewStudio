# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  ## deviseのストロングパラメーター用の記述
  before_action :configure_permitted_parameters, if: :devise_controller?            #  deviseの機能が使われる前にconfigure_permitted_parametersメソッドを実行する
  
  protected
  
  def configure_permitted_parameters                                                #  新規登録時にユーザー名とユーザーの写真を許可する
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
  end
end
