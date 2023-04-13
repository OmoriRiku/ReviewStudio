class Public::HomesController < ApplicationController
  def top
    @uses = Use.all
    @studios = Studio.limit(4).order(created_at: :desc)
  end

  def about
  end
end
