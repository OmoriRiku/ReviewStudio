class Users::SessionsController < Devise::SessionsController
  ## ゲストログイン機能
  def guest_sign_in
    user = EndUser.guest ## guestは自作メソッド(EndUsercontrollerで使用する)
    sign_in user #  ゲストログインでサインインする
    redirect_to root_path, notice: 'ゲストユーザーでログインしました' # トップページへ遷移する
  end
end