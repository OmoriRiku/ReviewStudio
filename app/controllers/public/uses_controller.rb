class Public::UsesController < ApplicationController
  before_action :is_user_login_authenticate, only: [:create, :edit, :update]
  before_action :set_use_id,                 only: [:edit, :update]
  before_action :get_all_stores,             only: [:index]
  
  def index                                           ## 用途一覧ページ
    @use = Use.new
    @uses = Use.all
  end
  
  def create                                          ## 用途新規登録機能
    @use = Use.new(use_params)
    @use.save
    redirect_to uses_path
  end

  def edit                                            ## 用途編集ページ
  end
  
  def update                                          ## 用途更新機能
    @use.update(use_params)
    redirect_to uses_path
  end
  
  private
  
  def is_user_login_authenticate                      ## ログインしていなければ元のページへ戻るメソッド
    unless admin_signed_in? || end_user_signed_in?
      redirect_back fallback_location: root_path
    end
  end
  
  def set_use_id                                      ## Useモデルから指定されたIDを取得するメソッド
    @use = Use.find(params[:id])
  end
  
  def use_params                                      ## ストロングパラメーター
    params.require(:use).permit(:name)
  end
end
