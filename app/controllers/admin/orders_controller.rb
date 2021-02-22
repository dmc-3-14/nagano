class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
		@order = Order.find(params[:id])
    #show.html内でorderd_item(中間テーブル)を呼び出すために使用する
		@orderd_items = OrderdItem.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: root_path)
  end

  private
# show.htmlにてorderd_itemの制作ステータスを更新できるようにするため、rderd_item_attributes: [:create_state] を記述しています
# attributesの使用方法は調べてもらえると。　僕は理解できてないまま攻略本みてコード書きました
  def order_params
    params.require(:order).permit(:state)
  end
end
















