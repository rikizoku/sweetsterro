class Customers::CustomersController < ApplicationController

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
  
  protected
  # 退会しているかを判断するメソッド
  def withdraw
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: parms[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])
      ## 【処理内容3】
    end
  end
  
  private

  def customer_params
    params.require(user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :phone_number, :email,)
  end

end
