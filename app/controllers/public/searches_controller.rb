class Public::SearchesController < ApplicationController
  def search_studio
    @word = params[:word] # 検索窓から渡された単語をインスタンス変数へ格納する
    
    if @word.length == 0 || @word.length >= 50 # 検索された単語が0文字もしくは50文字以上の場合元のページへ遷移する 
      redirect_to request.referer, notice: '検索文字が入力されていない、もしくは50文字以上入力されました。'
    else
      @result = Studio.search_for(@word) # search_forは自作メソッド(studio.rbファイルへ)
    end
  end
  
  def associated_result
    @word = params[:word] # ビューから渡された単語をインスタンス変数へ格納する
    @studio_ids = params[:studio_id] # アソシエーションを辿ってスタジオのidを配列で受け取りインスタンス変数へ格納する
    @sort = params[:sort] # ビューからソートする文字列を取得する（例：created_at: :descなど）
    @result = Studio.associated_studios(@studio_ids, @sort) # associated_studiosは自作メソッド(studio.rbファイルへ)
  end
end
