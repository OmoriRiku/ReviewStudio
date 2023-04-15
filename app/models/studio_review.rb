class StudioReview < ApplicationRecord
  validates :rate, length: {in: 1..5, message: 'は1~5段階で選択してください'} ## 評価のバリデーション、１〜５段階以外が入力されればエラー
  validates :number_studio, presence: true ## 利用人数のバリデーション、未入力時エラー
  validates :comment, presence: true, length: { maximum: 400 } ## レビュー本文のバリデーション、未入力時エラー
  
  belongs_to :end_user ## ユーザーとのリレーション。ユーザーはスタジオレビューを複数持っている
  
  belongs_to :studio ## スタジオとのリレーション。スタジオはスタジオレビューを複数持っている
                            
  belongs_to :use ## 用途とのリレーション。用途はスタジオレビューを複数持っている
end
