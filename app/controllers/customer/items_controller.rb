class Customer::ItemsController < ApplicationController
before_action :authenticate_customer!

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.where(sale_state: "true").limit(8)
    @item = Item.all
    @item_page = Item.page(params[:page]).per(8)
  end
end

