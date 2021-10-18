class HomesController < ApplicationController

  def top
    @items = Item.where(sale_status: "販売中")
  end

end
