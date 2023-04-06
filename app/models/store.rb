class Store < ApplicationRecord
  has_one_attached  :store_image      # 店舗の写真のカラム
  
  has_many  :studio                   # スタジオとのリレーション
                                      # 店舗はスタジオを複数持っている
                                      
  has_many  :store_review             # 店舗レビューとのリレーション
                                      # 店舗は店舗レビューを複数持っている
end
