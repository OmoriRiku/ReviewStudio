class StoreReview < ApplicationRecord
  validates :rate, length: {in: 1..5, message: 'は1~5段階で選択してください'}
  validates :comment, presence: true, length: {maximum: 400}
  
  belongs_to :end_user
  belongs_to :store
end
