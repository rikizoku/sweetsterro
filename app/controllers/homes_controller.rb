class HomesController < ApplicationController

  def top
    @items = Item.where(sale_status: "販売中")
    @genre = Genre.all
  end

end
