class CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end
  
  def withdraw_confirm
  end
  
  def withdraw
    
  end
  
  private

  def customer_params
    params.require(user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :phone_number, :email,)
  end

end
