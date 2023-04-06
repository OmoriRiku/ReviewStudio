class StoreReview < ApplicationRecord
  belongs_to :end_user    ## ユーザーとのリレーション
                          ## ユーザーは店舗レビューを複数持っている
                          
  belongs_to :store       ## 店舗とのリレーション
                          ## 店舗は店舗レビューを複数持っている
end
