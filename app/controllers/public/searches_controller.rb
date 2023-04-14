class Public::SearchesController < ApplicationController
  def search_studio
    @word = params[:word] # 検索窓から渡された単語をインスタンス変数へ格納する
    
    if @word.length == 0 || @word.length >= 50 # 検索された単語が0文字もしくは50文字以上の場合元のページへ遷移する 
      redirect_back fallback_location: root_path
    else
      @result = Studio.where('name like ?', "%#{@word}%") # 検索窓から渡された単語を曖昧検索する
    end
  end
  
  def associated_result
    @word = params[:word] # ビューから渡された単語をインスタンス変数へ格納する
    @studio_ids = params[:studio_id] # アソシエーションを辿ってスタジオのidを配列で受け取りインスタンス変数へ格納する
    @result = Studio.where(id: @studio_ids) # 渡されたスタジオの配列idsをwhere句で絞り込む
  end
end
