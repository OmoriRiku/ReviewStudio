class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.admin_guest ## ゲストログイン用(Users::SessionsControllerの.guestメソッド)
    find_or_create_by!(email: 'guest@example.com') do |user| # Adminにguest@example.comのemailがあるか判定しなければ新規作成する
      user.password = SecureRandom.urlsafe_base64 # パスワードをランダムに作成してpasswordカラムへ代入
    end
  end
end
