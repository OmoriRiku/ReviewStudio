class Public::HomesController < ApplicationController
  def top
    @uses = Use.all
  end

  def about
  end
end
