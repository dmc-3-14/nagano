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
    @cart_items = current_customer.cart_items
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
    redirect_to confirm_order_path(@order)
  end
  
  private
  def order_params
      params.require(:order).permit(:customer_id, :post_code, :address, :name, :billing_amount, :fee, :payment_method, :state )
  end

end