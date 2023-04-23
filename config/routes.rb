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
    resources :end_users, only: [:index, :show, :edit, :update], path: 'users/' do
      resources :store_reviews, only: [:index, :destroy]
      resources :studio_reviews, only: [:index, :destroy]
    end
    
    ## ユーザーの退会機能用ルーティング
    #  URL /users/:id/....
    get 'users/:id/unsubscribe' => 'end_users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'users/:id/withdraw' => 'end_users#withdraw', as: 'withdraw_user'
    
    # トップページのルーティング
    # URL /
    root to: 'homes#top'
    
    # aboutページのルーティング
    # URL /about
    get '/about' => 'homes#about'
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
    
    # 用途のルーティング
    # URL /uses/...
    resources :uses, except: [:new, :show]
    
    # 店舗のルーティング
    # 店舗レビュー用に入れ子にする
    # URL /stores/....
    resources :stores do
      resources :store_reviews, only: [:new, :create, :destroy]
    end
    # 検索用ルーティング
    get '/stores_search' =>  'stores#address_search_store'
    
    # スタジオのルーティング
    # スタジオレビュー用に入れ子にする
    # URL /studios/...
    resources :studios do
      resources :studio_reviews, only: [:new, :create, :destroy]
    end
    
    # アソシエーションで紐づいたすたじおを表示する
    get '/result_studio'  =>  'studios#associated_result_studio', as: 'associated_result'
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
