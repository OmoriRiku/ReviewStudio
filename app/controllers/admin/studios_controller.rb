class Admin::StudiosController < ApplicationController
  before_action :is_admin_login_authenticate, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_all_uses,                only: [:index, :show]
  before_action :get_all_stores,              only: [:index, :show]
  before_action :get_registered_use_name,     only: [:new, :edit]
  before_action :get_registered_store_name,   only: [:new, :edit]
  before_action :set_studio,                  only: [:show, :edit, :update, :destroy]
  
  def new                             ## 新規作成ページ
    @studio = Studio.new
  end
  
  def create                          ## 新規登録機能
    @studio = Studio.new(studio_params)
    @studio.save
    redirect_to studios_path
  end

  def index                           ## 一覧ページ
    @studios = Studio.all
  end

  def show                            ## 詳細ページ
  end

  def edit                            ## 編集ページ
  end
  
  def update                          ## 更新機能
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end
  
  def destroy                         ## 削除機能
    @studio.destroy
    redirect_to studios_path
  end
  
  private
  
  def get_registered_store_name       ## 登録されている店舗名を取得するメソッド
    @store = Store.all.map{ |store| [store.name, store.id] }
  end

  
  def get_registered_use_name         ## 登録されている用途名を取得するメソッド
    @use = Use.all.map{ |use| [use.name, use.id] }
  end
  
  def set_studio                      ## 特定のスタジオのidを取得するメソッド
    @studio = Studio.find(params[:id])
  end
  
  def studio_params                   ## ストロングパラメーター
    params.require(:studio).permit(:use_id, :store_id, :name, :introduction, :personal_price, :three_price, :more_price, :studio_image)
  end
end
