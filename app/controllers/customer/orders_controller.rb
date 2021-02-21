class Customer::OrdersController < ApplicationController
  
  def show
  end
 
  def index
  end
 
  def put
    @customer = current_customer
    @order_address = current_customer.address
    @order = Order.new
  end
  
  def confirm
    params[:order][:payment_method] = params[:order][:payment_method].to_i 
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    
    if params[:order][:address_method] == "0" 
      @order.post_code = current_customer.post_code 
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name

    elsif  params[:order][:address_method] ==  "1" 
      @order.post_code = Shipping.find(params[:order][:address_method]).post_code
      @order.address = Shipping.find(params[:order][:address_method]).address
      @order.name = Shipping.find(params[:order][:address_method]).name 

    elsif params[:order][:address] ==  "2" 
      @order = Shipping.new()
      @order.post_code = params[:order][:post_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.name = params[:order][:name] 
      @order.customer_id = current_customer.id 
      
      if @address.save
      @order.post_code = @shipping_address.post_code 
      @order.address = @shipping_addressippingaddress.shipping_address 
      @order.name = @shipping_address.name 
      
      else
        render 'put'
      end
  
    end
  end
  
    def complete
    end
  
    def index
    end
  
    def show
    end
  
    def create
     @order = current_user.orders.new(order_params)
     @order.save
     redirect_to confirm_orders_path(@order)
    end
  
    private
    def order_params
      params.require(:order).permit(:customer_id, :post_code, :address, :name, :billing_amount, :fee, :payment_method, :state )
    end
end