class Public::HomesController < ApplicationController
  def top
    @studios = Studio.limit(8).order(created_at: :desc)
  end

  def about
  end
end
