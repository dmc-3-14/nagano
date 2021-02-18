class Customer::ShippingsController < ApplicationController


  def create
    @shippings = Shipping.all
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      flash[:notice] = "Genre was successfully created"
      redirect_to shippings_path
    else
      render 'index'
    end
  end

  def index
    @shippings = Shipping.all
    @shipping = Shipping.new
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private
  def shipping_params
    params.require(:shipping).permit(:post_code, :address, :name)
  end

end
