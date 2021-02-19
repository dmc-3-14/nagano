class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.custamer_id = current_cusutomer.id
    @cart_item.save
    redirect_to cart_items_pathe
  end
 
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @custamer = Customer.find(current_cusutomer.id)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
  　cart_item.destroy
    redirect_to cart_items_path
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:custamer_id, :item_id, :amount)
  end
end
