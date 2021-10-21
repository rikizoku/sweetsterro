class Customers::AddressesController < ApplicationController

  def edit
  end
  
  def update
  end

   def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
       redirect_to address_path
    else
       @address_new = Address.new
       @addresses = current_customer.addresses
       render :index
    end
   end

     private


    def address_params
      params.require(:address).permit(:last_name, :first_name, :post_code, :address)
    end

end
