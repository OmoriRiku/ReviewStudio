class Store < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }                   
  validates :introduction, presence: true, length: { maximum: 800 }
  validates :telephone_number, numericality: { only_integer: true, message: 'は半角文字で入力してください' }, length: { maximum: 15 }
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた半角文字で入力してください' }
  validates :address, presence: true, length: { maximum: 50 }
  validates :store_image, presence: { message: 'を選択してください' }
  
  has_one_attached  :store_image
  
  def get_store_image(width, height)
  unless store_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    store_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  store_image.variant(resize_to_fill: [width, height]).processed
  end
  
  has_many  :studios, dependent: :destroy
  has_many  :store_reviews, dependent: :destroy
end
