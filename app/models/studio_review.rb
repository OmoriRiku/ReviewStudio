class StudioReview < ApplicationRecord
  validates :rate, presence: true                                   ## 評価のバリデーション、未入力時エラー
  validates :number_studio, presence: true                          ## 利用人数のバリデーション、未入力時エラー
  validates :comment, presence: true, length: { maximum: 400 }      ## レビュー本文のバリデーション、未入力時エラー
  
  belongs_to :end_user                                              ## ユーザーとのリレーション
                                                                    ## ユーザーはスタジオレビューを複数持っている
  
  belongs_to :studio                                                ## スタジオとのリレーション
                                                                    ## スタジオはスタジオレビューを複数持っている
                            
  belongs_to :use                                                   ## 用途とのリレーション
                                                                    ## 用途はスタジオレビューを複数持っている
end
