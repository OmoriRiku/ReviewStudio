class Use < ApplicationRecord
  has_many :studios # スタジオとのリレーション。使用用途はスタジオを複数持っている
  has_many :studio_reviews # スタジオレビューとのリレーション。使用用途はスタジオレビューを複数持っている
end
