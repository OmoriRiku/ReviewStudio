class Studio < ApplicationRecord
  has_many    :studio_reviews       # スタジオレビューとのリレーション
                                    # スタジオはスタジオレビューを複数持っている
  
  belongs_to  :store                # 店舗とのリレーション
                                    # スタジオは店舗を複数持っている
  
  belongs_to  :use                  # 用途とのリレーション
                                    # スタジオは用途を複数持っている
end
