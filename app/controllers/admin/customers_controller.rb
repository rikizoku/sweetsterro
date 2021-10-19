class Admin::CustomersController < ApplicationController
  
  def show
    @customer = customer.find(params[:id])
  end
  
  private
  
  def customer_params
    params.require.permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :tel, :is_deleted)
  end
  
end
