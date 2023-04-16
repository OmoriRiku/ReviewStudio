class Admin::StoreReviewsController < ApplicationController
  before_action :authenticate_end_user!, only: [:new, :create]
  
  def new ##　店舗レビュー新規作成ページ
    @store = Store.find(params[:store_id]) # レビューする店舗を特定する
    @store_review = StoreReview.new # ストアレビューのインスタンス作成
  end
  
  def create
    @store = Store.find(params[:store_id]) ## レビューする店舗を特定する
    @store_review = StoreReview.new(store_review_params) #  ストロングパラメーターを引数に初期化
    @store_review.end_user_id = current_end_user.id #  end_user_idと現在ログインしているユーザーの紐付け
    @store_review.store_id = @store.id #  store_idと店舗のidの紐付け
    if @store_review.save #  保存する
      flash[:notice] = 'レビューを投稿しました' # フラッシュメッセージを表示する
      redirect_to store_path(@store) # データを保存したら店舗の詳細ページへ遷移する
    else
      render :new # データが保存できなければ新規登録ページを表示する
    end
  end
  
  def destroy ## 削除機能
    @store = Store.find(params[:store_id]) #  レビューを削除する店舗を特定する
    @store_review = @store.store_reviews.find(params[:id]) #  該当のレビューを見つける(リレーションを辿って特定する)
    if @store_review.destroy #  レビューを削除する
      flash[:notice] = 'レビューを投稿しました' # フラッシュメッセージの表示
      redirect_to store_path(@store) # 店舗の詳細ページへ遷移する
    end
  end
  
  private
  
  def store_review_params ## ストロングパラメーター
    params.require(:store_review).permit(:rate,:comment) # idの紐付けをしないカラムを指定する
  end
end
