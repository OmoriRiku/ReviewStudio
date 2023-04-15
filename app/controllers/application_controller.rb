class ApplicationController < ActionController::Base
  protected
  #
  # ログイン判定用
  #
  ## 管理者がログインしていなければトップページへ遷移するメソッド
  def is_admin_login_authenticate
    unless admin_signed_in?
      redirect_to root_path, notice: '管理者ではありません。トップページへ遷移しました。'
    end
  end
end
