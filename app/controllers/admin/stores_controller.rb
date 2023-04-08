class Admin::StoresController < ApplicationController
  before_action :is_admin_login_authenticate, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  
  ## 新規登録ページ
  def new
    @store = Store.new
  end
  
  ## 新規登録機能
  def create
    @store = Store.new(store_params)
    @store.save
    redirect_to store_path(@store.id)
  end

  ## 一覧ページ
  def index
    @stores = Store.all
  end

  ## 詳細ページ
  def show
  end

  ## 編集ページ
  def edit
  end

  ## 更新機能
  def update
    @store.update(store_params)
    redirect_to store_path(@store)
  end

  ## 削除機能
  def destroy
    @store.destroy
    redirect_to stores_path
  end
  
  private
  
  ## Storeモデルから指定のIDを取得するメソッド
  def set_store
    @store = Store.find(params[:id])
  end
  
  ## 管理者がログインしていなければトップページへ遷移するメソッド
  def is_admin_login_authenticate
    unless admin_signed_in?
      redirect_to root_path
    end
  end
  
  ## ストロングパラメーター
  def store_params
    params.require(:store).permit(:name, :telephone_number, :store_image, :introduction)
  end
end
