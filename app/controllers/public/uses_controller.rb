class Public::UsesController < ApplicationController
  before_action :is_admin_login_authenticate, only: [:create, :edit, :update]
  before_action :set_use, only: [:edit, :update]
  
  def index ## 用途一覧ページ
    @use = Use.new # ビューへ渡すための初期化宣言
    @uses = Use.all # ビューへUseデータベースの全情報を渡す
  end

  def create ## 用途新規登録機能
    @use = Use.new(use_params) # ストロングパラメーターを引数に初期化 
    if @use.save # データを保存する
      redirect_to uses_path # 一覧ページへ遷移する
    else
      @uses = Use.all # renderする際にUseモデルの全データを渡す
      render :index # 保存できなければindexページを表示する
    end
  end

  def edit  ## 用途編集ページ
  end
  
  def update  ## 用途更新機能
    if @use.update(use_params) # ストロングパラメーターを引数にアップデート
      redirect_to uses_path # 一覧ページへ遷移する
    else
      render :edit # 保存できなければeditページを表示する
    end
  end
  
  private
  
  def set_use # URLからidを特定するメソッド
    @use = Use.find(params[:id])
  end
  
  def use_params ## ストロングパラメーター
    params.require(:use).permit(:name)
  end
end
