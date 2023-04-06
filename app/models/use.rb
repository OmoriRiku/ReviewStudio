class Use < ApplicationRecord
  belongs_to  :end_user         ## ユーザーとのリレーション
                                ## ユーザーは用途を複数持っている
  
  has_many    :studios          ## スタジオとのリレーション
                                ## スタジオは用途を複数持っている
  
  has_many    :studio_reviews   ## スタジオのレビューとのリレーション
                                ## スタジオレビューは用途を複数持っている
end
