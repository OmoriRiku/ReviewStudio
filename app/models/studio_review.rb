class StudioReview < ApplicationRecord
  validates :rate, presence: true
  validates :number_studio, presence: true
  validates :comment, presence: true, length: { maximum: 400 }
  belongs_to :end_user      ## ユーザーとのリレーション
                            ## ユーザーはスタジオレビューを複数持っている
  
  belongs_to :studio        ## スタジオとのリレーション
                            ## スタジオはスタジオレビューを複数持っている
                            
  belongs_to :use           ## 用途とのリレーション
                            ## 用途はスタジオレビューを複数持っている
end
