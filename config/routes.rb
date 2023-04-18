Rails.application.routes.draw do
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :end_users,skip: [:passwords], path: "/users", controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # ゲストログイン機能
  # URL /users/guest_sign_in
  devise_scope :end_user do
    post 'users/guest_sign_in', to: 'users/sessions#user_guest_sign_in'
  end
  ## ファイルパスをpublic/... へ
  #  urlを任意に指定する
  scope module: :public do
    # ユーザー編集用のルーティング
    # URL /users/...
    resources :end_users, only: [:edit, :update], path: 'users'
    # トップページのルーティング
    # URL /
    root to: 'homes#top'
    # aboutページのルーティング
    # URL /about
    get '/about' => 'homes#about'
    # 用途のルーティング
    # URL /uses/...
    resources :uses, only: [:index, :create, :edit, :update]
    # 検索用ルーティング
    get     '/search_studios'                          =>  'searches#search_studio'
    get     '/result_studio'                           =>  'searches#associated_result', as: 'associated_result'
  end
  # 管理者用
  # URL /customers/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  ## ゲストログイン機能
  #. admin/guest_sign_in
  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  
  ## ファイルパスをadmin/...へ
  #  urlを任意に指定する
  scope module: :admin do
    # 店舗のルーティング
    # 店舗レビューの削除用に入れ子にする
    # URL /stores/....
    resources :stores do
      resources :store_reviews, only: [:new, :create, :destroy]
    end
    # スタジオのルーティング
    # スタジオレビューの削除用に入れ子にする
    # URL /studios/...
    resources :studios do
      resources :studio_reviews, only: [:new, :create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
