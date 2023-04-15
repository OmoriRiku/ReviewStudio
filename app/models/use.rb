class Use < ApplicationRecord
  validates :name, uniqueness: true, length: { in: 1..20 }   ## 使用用途名のバリデーション、未入力時、同じ使用用途名、２０文字以上はエラー
  
  has_many :studios # スタジオとのリレーション。使用用途はスタジオを複数持っている
  has_many :studio_reviews # スタジオレビューとのリレーション。使用用途はスタジオレビューを複数持っている
end
