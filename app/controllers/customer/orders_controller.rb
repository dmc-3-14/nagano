class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!


  def show
    @order = Order.find(params[:id])
    @orderd_items = OrderdItem.where(order_id: params[:id])
    @cart_items = current_customer.cart_items
  end

  def index
    @orders = current_customer.orders

  end

  def put
    @customer = current_customer
    @order_address = current_customer.address
    @order = Order.new
  end

  def confirm
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)

    if params[:order][:address_method] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name

    elsif  params[:order][:address_method] ==  "1"
      shipping = Shipping.find(params[:order][:shipping_id])
      @order.post_code = shipping.post_code
      @order.address = shipping.address
      @order.name = shipping.name

    elsif params[:order][:address] ==  "2"
      @order = Shipping.new()
      @order.post_code = params[:order][:post_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.name = params[:order][:name]
      @order.customer_id = current_customer.id

      if @address.save
      @order.post_code = @shipping_address.post_code
      @order.address = @shipping_address.address
      @order.name = @shipping_address.name

      else
        render 'put'
      end
    end
      @cart_items = CartItem.where(customer_id: current_customer.id)
      @total = 0
  end

    def complete
    end

    def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @CartItems = current_customer.cart_items

      if  @order.save
        #orderd_itemsの保存
        current_customer.cart_items.each do |cart_item|
          @orderd_item = OrderdItem.new
          @orderd_item.item_id = cart_item.item_id
          @orderd_item.quantity = cart_item.amount
          @orderd_item.price = (cart_item.item.non_tax_price * 1.1).floor
          @orderd_item.order_id = @order.id  #注文商品に注文idを紐付け
          @orderd_item.save  #注文商品を保存
        end
        current_customer.cart_items.destroy_all
        redirect_to complete_orders_path
      else
        flash[:alert] = "お届け先が正しく入力されていません。お届け先の入力をお願いします。"
        redirect_to  put_orders_path
      end
    end

    private
    def order_params
      params.require(:order).permit(:customer_id, :post_code, :address, :name, :billing_amount, :fee, :payment_method, :state )
    end
end