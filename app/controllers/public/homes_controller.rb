class Public::HomesController < ApplicationController
  def top
    @studios = Studio.limit(8).order(created_at: :desc)     ## 最新12件を取得し最後に登録した順に並び替える
  end

  def about                                                 ## aboutページ
  end
end
