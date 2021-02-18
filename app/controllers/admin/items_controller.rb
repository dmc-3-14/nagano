class Admin::ItemsController < ApplicationController
# before_action :authenticate_user!を追加

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_items_path
    else
    render "new.html.erb"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path(@item.id)
    else
    render "edit.html.erb"
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :body, :genre_id, :non_tax_price, :sale_state)
  end
end
