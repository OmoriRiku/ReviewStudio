Rails.application.routes.draw do
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
    resources :uses, only: [:index, :edit]
    # 店舗レビュー用のルーティング
    post    '/stores/:store_id/store_reviews'         =>  'store_reviews#create',   as:  'user_store_store_review'
    delete  '/stores/:store_id/store_reviews/:id'     =>  'store_reviews#destroy'
    # スタジオレビューのルーティング
    get     '/studios/:studio_id/review_studios/new'  =>  'studio_reviews#new',     as:  'user_new_studio_studio_reviews'
    post    '/studios/:studio_id/review_studios'      =>  'studio_reviews#create',  as:  'user_studio_studio_reviews'
    delete  '/studios/:studio_id/review_studios/:id'  =>  'studio_reviews#destroy'
    # 検索用ルーティング
    get     'search/studios'                          =>  'searches#search_studio'
    get     'search/studios'                          =>  'searches#search_use'
  end
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :end_users,skip: [:passwords], path: "/users", controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  # URL /customers/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  ## ファイルパスをadmin/...へ
  #  urlを任意に指定する
  scope module: :admin do
    # 店舗のルーティング
    # 店舗レビューの削除用に入れ子にする
    # URL /stores/....
    resources :stores do
      resources :store_reviews, only: [:destroy]
    end
    # スタジオのルーティング
    # スタジオレビューの削除用に入れ子にする
    # URL /studios/...
    resources :studios do
      resources :studio_reviews, only: [:destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
