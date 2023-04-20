class Public::StoreReviewsController < ApplicationController
  def index ##　一覧ページ
    @user = EndUser.find(params[:end_user_id]) # ユーザーの特定を行う
    @store_reviews = @user.store_reviews.all # 特定したユーザーから店舗レビューの全データをビューへ渡す
  end
  
  def destroy ## レビュー削除機能
    @user = EndUser.find(params[:end_user_id]) # ユーザーの特定を行う
    store_review = @user.store_reviews.find(params[:id]) # 削除するレビューを特定する
    store_review.destroy # レビューを削除する
    redirect_to request.referer, notice: "レビューを削除しました" # レビュー一覧ページへ遷移する
  end
end
