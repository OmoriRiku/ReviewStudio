class Use < ApplicationRecord
  validates :name, uniqueness: true, length: { in: 1..20 }
  
  has_many :studios, dependent: :destroy
end
