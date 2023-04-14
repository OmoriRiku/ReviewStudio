class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, uniqueness: true                             # ユーザー名のバリデーション、未入力時。同じ名前が登録されていればエラー
  
  has_one_attached :profile_image                                               ## ユーザーの写真のカラム追加
  
  def get_profile_image(width, height)                                          ## 写真のメソッド、登録されていなければno_imageを表示する
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_fill: [width, height]).processed              # 縦横比を維持せずリサイズする
  end

  def self.guest                                                                ## ゲストログイン用(Users::SessionsControllerの.guestメソッド)
    find_or_create_by!(name: 'guestuser',email: 'guest@example.com') do |user|  # EndUserにguestuserの名前があるか判定しなければ新規作成する
      user.password = SecureRandom.urlsafe_base64                               # パスワードをランダムに作成してpasswordカラムへ代入
      user.name = "guestuser"                                                   # ユーザー名、guestuserをuser.nameカラムへ代入する
    end
  end
  
  has_many :studio_reviews, dependent: :destroy                                 ## スタジオのレビューとのリレーション記述
                                                                                #  ユーザーが削除されればレビューは削除される
                                                                    
  has_many :store_reviews,  dependent: :destroy                                 ## 店舗レビューとのリレーション記述
                                                                                #  ユーザーが削除されればレビューは削除される
end
