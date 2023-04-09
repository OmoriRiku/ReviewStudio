class Store < ApplicationRecord
  has_one_attached  :store_image      # 店舗の写真のカラム
  
  def get_store_image(width, height)
  unless store_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    store_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  end
  store_image.variant(resize_to_limit: [width, height]).processed
  end
  
  has_many  :studios                  # スタジオとのリレーション
                                      # 店舗はスタジオを複数持っている
                                      
  has_many  :store_reviews            # 店舗レビューとのリレーション
                                      # 店舗は店舗レビューを複数持っている
end
