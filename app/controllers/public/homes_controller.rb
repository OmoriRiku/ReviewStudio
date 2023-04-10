class Public::HomesController < ApplicationController
  def top
    @uses = Use.all
    @stores = Store.all
    @studios = Studio.all
    @word = ''
  end

  def about
  end
end
