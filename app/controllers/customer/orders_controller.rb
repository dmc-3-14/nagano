class Customer::OrdersController < ApplicationController
  
  def show
  end
 
  def index
  end
 
  def put
    @customer = current_customer
    @order_address = current_customer.address
    @order = Order.new
  end
  
  def confirm
    params[:order][:payment_method] = params[:order][:payment_method].to_i 
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    
    if params[:order][:address_method] == "1" #address_numberが　”1”　なら下記　ご自身の住所が選ばれたら
      @order.post_code = current_customer.post_code #自身の郵便番号をorderの郵便番号に入れる
      @order.address = current_customer.address #自身の住所をorderの住所に入れる
      @order.name = current_customer.last_name+current_customer.first_name #自身の宛名をorderの宛名に入れる

    elsif  params[:order][:address_method] ==  "2" #address_numberが　”2”　なら下記　登録済からの選択が選ばれたら
      @order.post_code = Address.find(params[:order][:address]).post_code #newページで選ばれた配送先住所idから特定して郵便番号の取得代入
      @order.address = Address.find(params[:order][:address]).shipping_address #newページで選ばれた配送先住所idから特定して住所の取得代入
      @order.name = Address.find(params[:order][:address]).name #newページで選ばれた配送先住所idから特定して宛名の取得代入

    elsif params[:order][:address_method] ==  "3" #address_numberが　”3”　なら下記　新しいお届け先が選ばれたら
      @address = Address.new() #変数の初期化
      @address.shipping_address = params[:order][:shipping_address] #newページで新しいお届け先に入力した住所を取得代入
      @address.name = params[:order][:name] #newページで新しいお届け先に入力した宛名を取得代入
      @address.post_code = params[:order][:postal_code] #newページで新しいお届け先に入力した郵便番号を取得代入
      @address.customer_id = current_customer.id #newページで新しいお届け先に入力したmember_idを取得代入
      
      if @address.save #保存
      @order.post_code = @address.post_code #上記で代入された郵便番号をorderに代入
      @order.name = @address.name #上記で代入された宛名をorderに代入
      @order.address = @address.shipping_address #上記で代入された住所をorderに代入
      else
        render 'new'
      end
  
    end
  
    def complete
    end
  
    def index
    end
  
    def show
    end
  
    def create
     @order = current_user.orders.new(order_params)
     @order.save
     redirect_to confirm_orders_path(@order)
    end
  
    private
    def order_params
      params.require(:order).permit(:customer_id, :post_code, :address, :name, :billing_amount, :fee, :payment_method, :state )
    end
 end