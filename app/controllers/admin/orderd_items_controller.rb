class Admin::OrderdItemsController < ApplicationController

  def update
    @orderd_item = OrderdItem.find(params[:id])
    @order = @orderd_item.order
    @orderd_item.update(orderd_item_params)

    if @orderd_item.create_state == "製作中" #製作ステータスが「製作中」なら入る
      @order.update(state: "製作中")
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def orderd_item_params
    params.require(:orderd_item).permit(:create_state)
  end

end
