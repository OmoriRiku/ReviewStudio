class Admin::StudioReviewsController < ApplicationController
  def new                                                       ## 新規登録ページ
    @studio = Studio.find(params[:studio_id])                   #  スタジオを特定する
    @studio_review = StudioReview.new                           #  スタジオレビューのインスタンス生成
  end
  
  def create                                                    ## 新規登録機能
    @studio = Studio.find(params[:studio_id])                   #  レビューを投稿するスタジオを特定する
    @studio_review = StudioReview.new(studio_review_params)     #  ストロングパラメーターを引数に渡してスタジオレビューを初期化する
    @studio_review.end_user_id = current_end_user.id            #  end_user_idとログインしているユーザーを紐づける
    @studio_review.studio_id = @studio.id                       #  studio_idとレビューするスタジオのidを紐づける
    if @studio_review.save                                      #  スタジオレビューを保存する
      flash[:notice] = 'レビューを投稿しました'                 #  フラッシュメッセージを表示する
      redirect_to studio_path(@studio)                          #  スタジオの詳細ページへ遷移する
    else
      render :new
    end
  end
  
  def destroy                                                   ## 削除機能
    @studio = Studio.find(params[:studio_id])                   #  レビューを削除するスタジオを特定する
    @studio_review = @studio.studio_reviews.find(params[:id])   #  削除するレビューを特定する(スタジオからのリレーションを辿って特定する)
    if @studio_review.destroy                                   #  レビューを削除する
      flash[:notice] = 'レビューを削除しました'                 #  フラッシュメッセージを表示する
      redirect_to studio_path(@studio)                          #  スタジオの詳細ページへ遷移する
    end
  end
  
  private
  
  def studio_review_params                                      ##  ストロングパラメーター
    params.require(:studio_review).permit(:studio_id, :use_id, :rate, :number_studio, :comment)   ## idの紐付けを行わないカラムを指定する
  end
end
