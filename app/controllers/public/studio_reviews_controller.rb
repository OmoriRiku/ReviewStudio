class Public::StudioReviewsController < ApplicationController
  def index # 一覧ページ
    @user = EndUser.find(params[:end_user_id]) # ユーザーを特定する
    @studio_reviews = @user.studio_reviews.all # 特定したユーザーからスタジオレビューの全データをビューへ渡す
  end
  
  def destroy # 削除機能
    @user = EndUser.find(params[:end_user_id]) # ユーザーを特定する
    studio_review = @user.studio_reviews.find(params[:id]) # 削除するレビューを特定する
    studio_review.destroy # ユーザーが投稿したレビューを削除する
    redirect_to request.referer, notice: "レビューを削除しました" # レビュー一覧ページへ遷移する
  end
end
