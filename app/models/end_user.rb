class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :profile_image, presence: true
  
  has_one_attached :profile_image                 ## ユーザーの写真のカラム追加
  
  has_many :studio_reviews, dependent: :nullify   ## 用途、スタジオのレビュー、店舗のレビューとのリレーション記述
                                                  #  ユーザーが削除されてもユーザーが投稿したデータは残る
                                                  #  各レコードのend_user_idをnull更新する
  has_many :store_reviews,  dependent: :nullify
end
