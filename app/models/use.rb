class Use < ApplicationRecord
  has_many :studios
  has_many :studio_reviews
end
