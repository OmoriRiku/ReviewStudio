class Public::UsesController < ApplicationController
  before_action :is_admin_login_authenticate, only: [:create, :edit, :update]
  
  def index ## 用途一覧ページ
    @use = Use.new # ビューへ渡すための初期化宣言
    @uses = Use.all # ビューへUseデータベースの全情報を渡す
  end

  def create ## 用途新規登録機能
    @use = Use.new(use_params) # ストロングパラメーターを引数に初期化 
    @use.save # データを保存する
    redirect_to uses_path # 一覧ページへ遷移する
  end

  def edit  ## 用途編集ページ
  end
  
  def update  ## 用途更新機能
    @use.update(use_params) # ストロングパラメーターを引数にアップデート
    redirect_to uses_path # 一覧ページへ遷移する
  end
  
  private
  
  def use_params ## ストロングパラメーター
    params.require(:use).permit(:name)
  end
end
