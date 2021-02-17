class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :body, :genre, :non_tax_price, :sale_state)
  end
end
