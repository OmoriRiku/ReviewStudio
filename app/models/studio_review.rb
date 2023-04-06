class StudioReview < ApplicationRecord
  belongs_to :end_user      ## ユーザーとのリレーション
                            ## ユーザーはスタジオレビューを複数持っている
  
  belongs_to :studio        ## スタジオとのリレーション
                            ## スタジオはスタジオレビューを複数持っている
                            
  belongs_to :use           ## 用途とのリレーション
                            ## 用途はスタジオレビューを複数持っている
end
