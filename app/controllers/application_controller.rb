class ApplicationController < ActionController::Base
  
  #
  # sidebar用
  #
  
  # 用途の全情報取得
  def get_all_uses
    @uses = Use.all
  end
  
  # 店舗の全情報取得
  def get_all_stores
    @stores = Store.all
  end
  
  #
  # ログイン判定用
  #
  
  ## 管理者がログインしていなければトップページへ遷移するメソッド
  def is_admin_login_authenticate
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
