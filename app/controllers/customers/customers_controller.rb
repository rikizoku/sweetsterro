class Customers::CustomersController < ApplicationController

  def show

  end

  def edit

  end

  def update
    if current_customer.update(customer_params)
      redirect_to customers_path
    else
      render "edit"
    end
  end

  def withdraw_confirm

  end




  def withdraw_confirm

  end



  def withdraw
    #statusのみをtrueにアップデート
    current_customer.update(status: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone_number, :email,)

  end

end
