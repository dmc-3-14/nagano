class Admin::OrderdItemsController < ApplicationController
  def update
    @orderd_item = OrderdItem.find(params[:id])
    @order = @orderd_item.order
  end
end