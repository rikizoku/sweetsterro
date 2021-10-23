class Customers::OrdersController < ApplicationController


  #注文情報入力ページ
  def new
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
  end
  #注文情報入力ページ

 #注文情報入力ページ
  def create
    session[:payment_method] = params[:payment_method]
    if params[:select] == "select_address"
       session[:address] = params[:address]
    elsif params[:select] == "my_address"
      session[:address] ="〒" + current_customer.post_code+current_customer.address+current_customer.last_name+current_customer.first_name
    end
    if session[:address].present? && session[:payment_method].present?
       @order.save
       redirect_to confirm_orders_path
    else
       flash[:order_new] = "支払方法とお届け先を選択して下さい"
       redirect_to new_order_path
    end
  end
 #注文情報入力ページ

   def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @address = current_customer.addresses.first
    @address = Address.new
    if params[:order][:select] == 1
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.post_code
    elsif params[:order][:select] == 2
      @id =  params[:order][:address_id]
      @order_address = Address.find(@id)
      @order.name = @order_address.name
      @order.address = @order_address.address
      @order.postal_code = @order_address.post_code
    else
       @order.name = params[:order][:name]
       @order.address = params[:order][:address]
       @order.postal_code = params[:order][:post_code]
    end
       #render :new if @order.invalid?
   end


  def show
    @cart_items = current_customer.cart_items.all
    @order = Order.find(params[:id])
  end

  private

  def address_params
     params.require(:address).permit(:last_name, :first_name, :post_code, :address)
  end

  def order_params
   params.require(:order).permit(:name, :address, :total_payment,:payment_method)
  end

end
