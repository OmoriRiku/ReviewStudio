class Users::SessionsController < Devise::SessionsController
  ## ゲストログイン機能
  def user_guest_sign_in # ユーザーのゲストログイン機能
    user = EndUser.user_guest ## guestは自作メソッド(EndUsercontrollerで使用する)
    sign_in user  # ゲストユーザーでサインインする
    redirect_to root_path, notice: 'ゲストユーザーでログインしました(ユーザー側)' # トップページへ遷移しフラッシュメッセージの表示を行う
  end
  
  def admin_guest_sign_in # 管理者のゲストログイン機能
    user = Admin.admin_guest  ## admin_guestは自作メソッド(EndUsercontrollerで使用する)
    sign_in user  # ゲストユーザーでサインインする
    redirect_to root_path, notice: 'ゲストユーザーでログインしました（管理者側）' # トップページへ遷移しフラッシュメッセージの表示を行う
  end
end