class Store < ApplicationRecord
  # 店舗の写真のカラム
  has_one_attached  :store_image
  
  ## 店舗の写真が登録されていれば表示する、それ以外はno_imageを表示する
  def get_store_image
    (store_image.attached?) ? store_image : "no_image.jpg"
  end
  
  ## スタジオとのリレーション
  # 店舗はスタジオを複数持っている
  has_many  :studios
                                      
  ## 店舗レビューとのリレーション
  # 店舗は店舗レビューを複数持っている
  has_many  :store_reviews
end
