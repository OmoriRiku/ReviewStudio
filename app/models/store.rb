class Store < ApplicationRecord
  validates :name, presence: { message: 'を入力してください' }, uniqueness: true, length: {maximum: 20} ## 店舗名のバリデーション、２０文字以上の場合エラー                     
  validates :introduction, presence: true, length: { maximum: 800 } ## 店舗説明文のバリデーション、500文字以上、未入力時エラー
  validates :telephone_number, numericality: { only_integer: true, message: 'は半角文字で入力してください' }, length: { maximum: 15 } ## 店舗電話番号のバリデーション、半角英数字、5~15文字以内でなければエラー
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた半角文字で入力してください' } ## 店舗の郵便番号のバリデーション、半角文字、７文字でなければエラー
  validates :address, presence: true, length: { maximum: 50 } ## 店舗の住所のバリデーション、未入力、50文字以上はエラー
  validates :store_image, presence: { message: 'を選択してください' } ## 店舗の写真のバリデーション
  
  has_one_attached  :store_image # 店舗の写真のカラム
  
  def get_store_image(width, height) # 店舗写真のメソッド、画像が登録されていなければno_imageを表示する。
  unless store_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    store_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  store_image.variant(resize_to_fill: [width, height]).processed # 縦横比を維持せず指定の値にリサイズする
  end
  
  has_many  :studios, dependent: :destroy  ## スタジオとのリレーション。店舗はスタジオを複数持っている。店舗が削除されればスタジオも削除される
                                      
  has_many  :store_reviews, dependent: :destroy ## 店舗レビューとのリレーション。店舗は店舗レビューを複数持っている。店舗が削除されれば店舗レビューも削除される
end
