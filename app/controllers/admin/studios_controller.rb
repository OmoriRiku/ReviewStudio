class Admin::StudiosController < ApplicationController
  before_action :is_admin_login_authenticate,             only: [:new, :create, :edit, :update, :destroy]
  before_action :get_registered_use_name,                 only: [:new, :edit]
  before_action :get_registered_store_name,               only: [:new, :edit]
  before_action :set_studio,                              only: [:show, :edit, :update, :destroy]
  
  def new ## 新規作成ページ
    @studio = Studio.new #  ビューへ渡すための空のモデルオブジェクト生成
  end
  
  def create ## 新規登録機能
    @studio = Studio.new(studio_params) # データを受け取り新規登録するためのモデルオブジェクト生成
    if @studio.save # データを保存する
      flash[:notice] = 'スタジオを新規登録いたしました！' # フラッシュメッセージの表示
      redirect_to studio_path(@studio.id) # 保存できればスタジオの詳細ページへ遷移する
    else
      render :new # 保存できなければ新規登録ページを表示する
    end
  end

  def index ## 一覧ページ
    @studios = Studio.all # スタジオの全データ取得
  end

  def show ## 詳細ページ
  end

  def edit ## 編集ページ
  end
  
  def update ## 更新機能
    if @studio.update(studio_params) # データを受け取り更新する
      flash[:notice] = 'スタジオを更新しました！' # フラッシュメッセージの表示
      redirect_to studio_path(@studio) # スタジオの詳細ページへ遷移する
    else
      render :show # 保存できなければ編集ページへ遷移する
    end
  end
  
  def destroy ## 削除機能
    if @studio.destroy # スタジオを削除する
      flash[:notice] = 'スタジオを削除しました' # フラッシュメッセージの表示
      redirect_to studios_path # 削除したら一覧ページへ遷移する
    end
  end
  
  private
  
  def get_registered_store_name ## 登録されている店舗名を取得するメソッド
    @store = Store.all.map{ |store| [store.name, store.id] }
  end

  
  def get_registered_use_name ## 登録されている用途名を取得するメソッド
    @use = Use.all.map{ |use| [use.name, use.id] }
  end
  
  def set_studio ## 特定のスタジオのidを取得するメソッド
    @studio = Studio.find(params[:id])
  end
  
  def studio_params  ## ストロングパラメーター
    params.require(:studio).permit(:use_id, :store_id, :name, :introduction, :personal_price, :three_price, :more_price, :studio_image)
  end
end
