class Public::HomesController < ApplicationController
  def top
    @uses = Use.all
    @stores = Store.limit(4).order(created_at: :desc)
    @studios = Studio.limit(4).order(created_at: :desc)
  end

  def about
  end
end
