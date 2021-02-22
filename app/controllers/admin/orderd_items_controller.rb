class Admin::OrderdItemsController < ApplicationController

  def update
    @orderd_item = OrderdItem.find(params[:id])
    @order = @orderd_item.order
    @orderd_item.update

    if @order_item.making_status == "製作中" #製作ステータスが「製作作中」なら入る
      @order.update(order_status: 2)
	  end
	end

  private

  def orderd_item_params
    params.require(:orderd_item).permit(:create_state)
  end

end
