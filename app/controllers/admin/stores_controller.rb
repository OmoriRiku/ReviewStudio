class Admin::StoresController < ApplicationController
  before_action :is_admin_login_authenticate, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_all_uses,                only: [:index, :show]
  before_action :set_store,                   only: [:show, :edit, :update, :destroy]

  def new                                 ## 新規登録ページ
    @store = Store.new
  end
  
  def create                              ## 新規登録機能
    @store = Store.new(store_params)
    @store.save
    redirect_to store_path(@store.id)
  end
  
  def index                               ## 一覧ページ
    @stores = Store.all
  end

  def show                                ## 詳細ページ
    @store_review = StoreReview.new
    @stores = Store.all
  end

  def edit                                ## 編集ページ
  end

  def update                              ## 更新機能
    @store.update(store_params)
    redirect_to store_path(@store)
  end

  def destroy                             ## 削除機能
    @store.destroy
    redirect_to stores_path
  end
  
  def get_average_rate
    StoreReview.avarage(:rate)
  end
  
  private
  
  def set_store                           ## Storeモデルから特定のIDを取得するメソッド
    @store = Store.find(params[:id])
  end
  
  def store_params                        ## ストロングパラメーター
    params.require(:store).permit(:name, :telephone_number, :store_image, :introduction)
  end
end
