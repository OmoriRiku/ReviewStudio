class Public::UsesController < ApplicationController
  # edit,updateアクションメソッドの実行前にset_user_idを実行する
  before_action :set_use_id, only: [:edit, :update]
  
  ## 用途一覧ページ
  def index
    @uses = Use.all
    @use = Use.new
  end
  
  ## 用途新規登録機能
  def create
    @use = Use.new(use_params)
    @use.save
    redirect_to uses_path
  end

  ## 用途編集ページ
  def edit
  end
  
  ## 用途更新機能
  def update
    @use.update(use_params)
    redirect_to uses_path
  end
  
  private
  
  ## Useモデルから指定されたIDを取得するメソッド
  def set_use_id
    @use = Use.find(params[:id])
  end
  
  ## ストロングパラメーター
  def use_params
    params.require(:use).permit(:name)
  end
end
