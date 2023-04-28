class StudioReview < ApplicationRecord
  validates :rate, length: { in: 1..5, message: 'は1~5段階で選択してください' }
  validates :number_studio, presence: true, length: { in: 1..15, message: 'は1~15名でしてください' }
  validates :comment, presence: true, length: { maximum: 400 }
  
  belongs_to :end_user
  belongs_to :studio
end
