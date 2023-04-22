class Admin::StoresController < ApplicationController
  before_action :is_admin_login_authenticate,     only: [:new, :create, :edit, :update, :destroy]
  before_action :set_store,                       only: [:show, :edit, :update, :destroy]
  before_action :sort_store_review,               only: [:show]
  before_action :sort_studio_price,               only: [:show]

  def new
    @store = Store.new
  end
  
  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:notice] = "店舗を作成いたしました!"
      redirect_to store_path(@store.id)
    else
      render :new
    end
  end
  
  def index
    @stores = Store.all.page(params[:page]).per(8)
  end

  def show
  end

  def edit
  end

  def update
    if @store.update(store_params)
      flash[:notice] = '店舗を更新いたしました'
      redirect_to store_path(@store)
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice: "店舗を削除しました"
  end
  
  def address_search_store
    keyword = params[:word]
    if keyword.present?
      @result = []
      keyword.split(/[[:blank:]]+/).each do |keyword|
        next if keyword == ""
        @result += Store.where('address LIKE ?', "%#{keyword}%")
      end
      @result.uniq!
    else
      redirect_to request.referer, notice: '検索ワードが入力されていません'
    end
  end
  
  private
  
  def sort_studio_price
    sort_studio_price = params[:sort_studio_price]
    @sort_studio_price = @store.studios.order(sort_studio_price)
  end
  
  def sort_store_review
    sort_store_review = params[:sort_store_review]
    @sort_store_review = @store.store_reviews.order(sort_store_review)
  end
  
  def set_store
    @store = Store.find(params[:id])
  end
  
  def store_params
    params.require(:store).permit(:name, :telephone_number, :store_image, :introduction, :post_code, :address)
  end
end
