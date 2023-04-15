class Studio < ApplicationRecord
  validates :name, presence: true ## スタジオ名のバリデーション、未入力時エラー
  validates :introduction, presence: true, length: { maximum: 400, message: 'は400文字以内で入力してください' } ## スタジオの説明文のバリデーション、未入力時、４００時以上はエラー
  validates :personal_price, presence: true, numericality: { only_integer: true, message: 'は半角文字で入力してください' } ## 個人料金のバリデーション、未入力、半角文字で入力しなければエラー
  validates :three_price, presence: true, numericality: { only_integer: true, message: 'は半角文字で入力してください' } ## 3名料金のバリデーション、未入力、半角文字で入力しなければエラー
  validates :more_price, presence: true, numericality: { only_integer: true, message: 'は半角文字で入力してください' } ## 4名以上料金のバリデーション、未入力、半角文字で入力しなければエラー
  
  
  has_one_attached :studio_image # スタジオの写真のカラム追加
  
  def get_studio_image(width, height) #　写真のメソッド、画像が登録されていなければno_imageを表示する。
  unless studio_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    studio_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  studio_image.variant(resize_to_fill: [width, height]).processed # 縦横比を維持せず指定の値にリサイズする
  end
  
  def self.search_for(word) # 検索窓から入力された値を引数に取る
    where('name like ?', "%" + "#{word}" + "%" ) # 曖昧検索を行いwhere句で絞り込む
  end
  
  def self.associated_studios(studio_ids) # link_toで指定されたidの配列を引数に取る
    where(id: studio_ids) # 渡されたスタジオのid配列をwhere句で絞り込む
  end
  
  has_many    :studio_reviews, dependent: :destroy # スタジオレビューとのリレーション。スタジオはスタジオレビューを複数持っている。スタジオが削除されるとスタジオレビューも削除される
  
  belongs_to  :store # 店舗とのリレーション。店舗はスタジオを複数持っている
  
  belongs_to  :use # 用途とのリレーション。用途はスタジオを複数持っている
end
