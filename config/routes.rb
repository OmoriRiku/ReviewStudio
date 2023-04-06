Rails.application.routes.draw do
  # 管理者用
  # URL /customers/sign_in ...
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  scope module: :admin do
    resources :stores do
      resources :store_reviews, only: [:destroy]
    end
    resources :studios do
      resources :studio_reviews, only: [:destroy]
    end
  end
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :uses, only: [:index, :edit]
    post    '/stores/:store_id/store_reviews'         =>  'store_reviews#create',   as:  'user_store_store_review'
    delete  '/stores/:store_id/store_reviews/:id'     =>  'store_reviews#destroy'
    get     '/studios/:studio_id/review_studios/new'  =>  'studio_reviews#new',     as:  'user_new_studio_studio_reviews'
    post    '/studios/:studio_id/review_studios'      =>  'studio_reviews#create',  as:  'user_studio_studio_reviews'
    delete  '/studios/:studio_id/review_studios/:id'  =>  'studio_reviews#destroy'
    get     'search/studios'                          =>  'searches#search_studio'
    get     'search/studios'                          =>  'searches#search_use'
  end
  
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :end_users, path: "/users", controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    resources :end_users, only: [:edit, :update], path: 'users'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
