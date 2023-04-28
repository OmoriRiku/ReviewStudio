class ApplicationController < ActionController::Base
  protected
  ## 管理者もしくはユーザーがログインしていれば元のページへ遷移するメソッド
  def is_login_redirect_back
    if end_user_signed_in? || admin_signed_in?
      redirect_back(fallback_location: root_path, notice: "すでにログインしています")
    end
  end
  
  ## 管理者がログインしていなければトップページへ遷移するメソッド
  def is_admin_login_authenticate
    unless admin_signed_in?
      redirect_to root_path, notice: '管理者ではありません。トップページへ遷移しました。'
    end
  end
  
end
