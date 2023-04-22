class Studio < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true, length: { maximum: 400, message: 'は400文字以内で入力してください' }
  validates :personal_price, length: { in: 3..5, message: 'は3桁~5桁以内で入力してください' }, numericality: { only_integer: true, message: 'は半角文字で入力してください' }
  validates :three_price, length: { in: 3..6, message: 'は3桁~6桁以内で入力してください' }, numericality: { only_integer: true, message: 'は半角文字で入力してください' }
  validates :more_price, length: { in: 3..6, message: 'は3桁~6桁以内で入力してください' }, numericality: { only_integer: true, message: 'は半角文字で入力してください' }
  
  
  has_one_attached :studio_image
  
  def get_studio_image(width, height)
  unless studio_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    studio_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  studio_image.variant(resize_to_fill: [width, height]).processed
  end
  
  def self.associated_studios(studio_ids, sort)
    where(id: studio_ids).order(sort)
  end
  
  has_many    :studio_reviews, dependent: :destroy
  belongs_to  :store
  belongs_to  :use
end
