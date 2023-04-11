class Public::SearchesController < ApplicationController
  def search_studio
    @word = params[:word]
    
    if @word.length == 0 || @word.length >= 50
      redirect_back fallback_location: root_path
    else
      @result = Studio.where('name like ?', "%#{@word}%")
    end
  end
  
  def associated_result
    @word = params[:word]
    @studio_ids = params[:studio_id]
    @result = Studio.where(id: @studio_ids)
  end
end
