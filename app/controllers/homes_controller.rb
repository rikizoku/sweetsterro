class HomesController < ApplicationController

  before_action :authenticate_customer!, except: [:top, :about]

  def top
    @items = Item.where(sale_status: "販売中")
    @genres = Genre.where
    @genre = Genre.name
  end

end
