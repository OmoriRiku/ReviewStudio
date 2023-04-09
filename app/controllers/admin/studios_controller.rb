class Admin::StudiosController < ApplicationController
  def new
    @studio = Studio.new
    @store = Store.all.map{ |store| [store.name, store.id] }
    @use = Use.all.map{ |use| [use.name, use.id] }
  end
  
  def create
    @studio = Studio.new(studio_params)
    @studio.save
    redirect_to studios_path
  end

  def index
    @studios = Studio.all
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def studio_params
    params.require(:studio).permit(:use_id, :store_id, :name, :introduction, :personal_price, :three_price, :more_price)
  end
end
