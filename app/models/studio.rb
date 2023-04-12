class Studio < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 400, message: '400文字以内で入力してください' }
  validates :personal_price, presence: true, numericality: true
  validates :three_price, presence: true, numericality: true
  validates :more_price, presence: true, numericality: true
  has_one_attached :studio_image
  
  has_many    :studio_reviews, dependent: :destroy  # スタジオレビューとのリレーション
                                                    # スタジオはスタジオレビューを複数持っている
                                                    # スタジオが削除されるとスタジオレビューも削除される
  
  belongs_to  :store                # 店舗とのリレーション
                                    # 店舗はスタジオを複数持っている
  
  belongs_to  :use                  # 用途とのリレーション
                                    # 用途はスタジオを複数持っている
end
