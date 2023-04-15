class StoreReview < ApplicationRecord
  validates :rate, presence: true, length: {in: 1..5}
  validates :comment, length: {maximum: 400}
  
  belongs_to :end_user    ## ユーザーとのリレーション。ユーザーは店舗レビューを複数持っている
                          
  belongs_to :store       ## 店舗とのリレーション。店舗は店舗レビューを複数持っている
end
