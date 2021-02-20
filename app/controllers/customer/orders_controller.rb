class Customer::OrdersController < ApplicationController
  def show
  end

  def index
  end

  def put
    @customer=current_customer
    @order_address = current_customer.address  
  end

  def confirm
  end

  def complete
  end
  
  def create
    @order = current_user.orders.new(order_params)
    @order.save
    redirect_to confirm_order_path(@order)
  end
end
