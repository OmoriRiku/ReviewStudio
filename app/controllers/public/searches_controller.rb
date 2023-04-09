class Public::SearchesController < ApplicationController
  
  def search_studio
    @word = params[:word]
    @result = Studio.where('name like ?', "%#{@word}%")
  end
  
  def associated_result
    @word = params[:word]
    @studio_ids = params[:studio_id]
    @result = Studio.where(id: @studio_ids)
  end
end
