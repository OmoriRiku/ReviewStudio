class Admin::StoresController < ApplicationController
  before_action :is_admin_login_authenticate,     only: [:new, :create, :edit, :update, :destroy]
  before_action :set_store,                       only: [:show, :edit, :update, :destroy]

  def new ## 新規登録ページ
    @store = Store.new # ビューへ渡すための空のモデルオブジェクト生成
  end
  
  def create ## 新規登録機能
    @store = Store.new(store_params) #  データを受け取り新規登録するためのモデルオブジェクト生成
    if @store.save #  データを保存する
      flash[:notice] = "店舗を作成いたしました!" #  フラッシュメッセージの表示
      redirect_to store_path(@store.id) #  保存できたら店舗の詳細ページへ遷移する
    else
      render :new #  保存できなければ再度新規登録ページを表示する
    end
  end
  
  def index ## 一覧ページ
    @stores = Store.all # 店舗の全データ取得
  end

  def show ## 詳細ページ
    @studios = @store.studios.all
    @studios = Studio.order(params[:sort])
  end

  def edit ## 編集ページ
  end

  def update ## 更新機能
    if @store.update(store_params) # データを更新する
      flash[:notice] = '店舗を更新いたしました' # フラッシュメッセージの表示
      redirect_to store_path(@store) # 更新できたら店舗の詳細ページへ遷移する
    else
      render :edit # 更新できなければ再度編集ページを表示する
    end
  end

  def destroy ## 削除機能
    @store.destroy #  店舗を削除する
    redirect_to stores_path # 店舗の一覧ページへ遷移する
  end
  
  private
  
  def set_store ## Storeモデルから特定のIDを取得するメソッド
    @store = Store.find(params[:id])
  end
  
  def store_params ## ストロングパラメーター
    params.require(:store).permit(:name, :telephone_number, :store_image, :introduction, :post_code, :address)
  end
end
