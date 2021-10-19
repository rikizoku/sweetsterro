class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
    @customer_page = Customer.page(params[:page])
  end

end
