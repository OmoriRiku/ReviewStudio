class Store < ApplicationRecord
  validates :name, :introduction, :store_image, presence: true            ## 店舗名、説明文、店舗の写真が未入力時のバリデーション
  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 800 }                       ## 店舗説明文が未入力、500文字以上記載の際のバリデーション
  validates :telephone_number, numericality: true, length: { in: 5..15 }  ## 店舗電話番号が半角英数字、5~15文字以内のバリデーション
  
  has_one_attached  :store_image                                          # 店舗の写真のカラム
  
  def get_store_image                                                     ## 店舗の写真が登録されていれば表示する、それ以外はno_imageを表示する
    (store_image.attached?) ? store_image : "no_image.jpg"
  end
  
  has_many  :studios, dependent: :destroy                                 ## スタジオとのリレーション
                                                                          # 店舗はスタジオを複数持っている
                                      
  has_many  :store_reviews, dependent: :destroy                           ## 店舗レビューとのリレーション
                                                                          # 店舗は店舗レビューを複数持っている
end
