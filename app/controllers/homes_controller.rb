class HomesController < ApplicationController

  def top
    @items = Item.where(sale_status: "販売中")
    @genres = Genre.where
    @genre = Genre.name
  end

end
