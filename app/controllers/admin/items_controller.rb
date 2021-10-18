class Admin::ItemsController < ApplicationController

  def show
    @item = item.find_by(id: params[:id])
  end

end
