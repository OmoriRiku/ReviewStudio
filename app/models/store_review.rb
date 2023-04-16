class StoreReview < ApplicationRecord
  validates :rate, length: {in: 1..5, message: 'は1~5段階で選択してください'} ## 評価のバリデーション、１〜５段階以外が入力されればエラー
  validates :comment, presence: true, length: {maximum: 400} ## レビュー本文のバリデーション、未入力、４００文字以上はエラー
  
  belongs_to :end_user    ## ユーザーとのリレーション。ユーザーは店舗レビューを複数持っている
                          
  belongs_to :store       ## 店舗とのリレーション。店舗は店舗レビューを複数持っている
end
