class Store < ApplicationRecord
  validates :name, uniqueness: true
  
  validates :telephone_number, numericality: true
  
  has_one_attached  :store_image  # 店舗の写真のカラム
  
  def get_store_image             ## 店舗の写真が登録されていれば表示する、それ以外はno_imageを表示する
    (store_image.attached?) ? store_image : "no_image.jpg"
  end
  
  has_many  :studios              ## スタジオとのリレーション
                                  # 店舗はスタジオを複数持っている
                                      
  has_many  :store_reviews        ## 店舗レビューとのリレーション
                                  # 店舗は店舗レビューを複数持っている
end
