class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  ## ユーザーの写真のカラム追加
  has_one_attached :profile_image
  
  ## 用途、スタジオのレビュー、店舗のレビューとのリレーション記述
  #  ユーザーが削除されてもユーザーが投稿したデータは残る
  #  各レコードのend_user_idをnull更新する
  has_many :uses,           dependent: :nullify
  has_many :studio_reviews, dependent: :nullify
  has_many :store_reviews,  dependent: :nullify
end
