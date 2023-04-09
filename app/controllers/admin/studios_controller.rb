class Admin::StudiosController < ApplicationController
  before_action :set_use,     only: [:new, :edit]
  before_action :set_store,   only: [:new, :edit]
  before_action :set_studio,  only: [:show, :edit, :update, :destroy]
  
  def new
    @studio = Studio.new
  end
  
  def create
    @studio = Studio.new(studio_params)
    @studio.save
    redirect_to studios_path
  end

  def index
    @studios = Studio.all
    @word = ''
  end

  def show
  end

  def edit
  end
  
  def update
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end
  
  def destroy
  end
  
  private
  
  def set_store
    @store = Store.all.map{ |store| [store.name, store.id] }
  end
  
  def set_use
    @use = Use.all.map{ |use| [use.name, use.id] }
  end
  
  def set_studio
    @studio = Studio.find(params[:id])
  end
  
  def studio_params
    params.require(:studio).permit(:use_id, :store_id, :name, :introduction, :personal_price, :three_price, :more_price, :studio_image)
  end
end
