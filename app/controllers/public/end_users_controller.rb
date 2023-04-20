class Public::EndUsersController < ApplicationController
  before_action :set_user,          only: [:show, :edit, :update, :unsubscribe, :withdraw]
  before_action :ensure_guest_user, only: [:edit, :unsubscribe]
  before_action :ensure_user_admin, only: [:edit, :unsubscribe]
  
  def index
    @users = EndUser.all # ユーザーの全データをビューへ渡す
  end
    
  def show ## ユーザー詳細ページ
  end
  
  def edit ## ユーザー編集ページの表示
  end
  
  def update ## ユーザー情報の更新
    @user.update(user_params) # ストロングパラメーターを受け取り更新する
    redirect_to end_user_path(@user) # 編集後はユーザーの詳細ページへ遷移する
  end
  
  def unsubscribe
  end
  
  def withdraw
    @user.update(is_active: true)
    reset_session
    redirect_to root_path, notice: "退会いたしました。"
  end
  
  private
  
  def ensure_guest_user ## ゲストユーザーで編集ページへ遷移しようとした場合、トップページへ遷移する
    @user = EndUser.find(params[:id])
    if @user.name == "guestuser"
      redirect_to end_user_path(current_end_user), notice: 'ゲストユーザーは編集できません'
    end
  end
  
  def ensure_user_admin
    @user = EndUser.find(params[:id])
    unless @user == current_end_user || admin_signed_in?
      redirect_to end_user_path(@user), notice: "他のユーザーの編集はできません。"
    end
  end
  
  def set_user ## deviseの機能からcurrent_end_userで個人を特定してインスタンス変数へ代入する
    @user = EndUser.find(params[:id])
  end
  
  def user_params ## ストロングパラメーター
    params.require(:end_user).permit(:name, :profile_image, :is_active)   #  end_usersモデルのname,profile_imageカラムのみ扱う
  end
end
