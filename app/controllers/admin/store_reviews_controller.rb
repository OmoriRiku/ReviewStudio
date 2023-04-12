class Admin::StoreReviewsController < ApplicationController
  def new                                                   ##　店舗レビュー新規作成ページ
    @store = Store.find(params[:store_id])                  #   レビューする店舗を特定する
    @store_review = StoreReview.new                         #   ストアレビューのインスタンス作成
  end
  
  def create
    @store = Store.find(params[:store_id])                  ## レビューする店舗を特定する
    @store_review = StoreReview.new(store_review_params)    #  ストロングパラメーターを引数に初期化
    @store_review.end_user_id = current_end_user.id         #  end_user_idと現在ログインしているユーザーの紐付け
    @store_review.store_id = @store.id                      #  store_idと店舗のidの紐付け
    if @store_review.save                                   #  保存する
      flash[:review_notice] = 'レビューを投稿しました'
      redirect_to store_path(@store)                        #  店舗の詳細ページへ遷移する
    else
      render :new
    end
  end
  
  def destroy                                               ## 削除機能
    @store = Store.find(params[:store_id])                  #  レビューを削除する店舗を特定する
    @store_review = @store.store_reviews.find(params[:id])  #  該当のレビューを見つける(リレーションを辿って特定する)
    @store_review.destroy                                   #  レビューを削除する
    redirect_to store_path(@store)                          #  店舗の詳細ページへ遷移する
  end
  
  private
  
  def store_review_params                                   ## ストロングパラメーター
    params.require(:store_review).permit(:rate,:comment)    #  idの紐付けをしないカラムを指定する
  end
end
