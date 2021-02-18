class Customer::ShippingsController < ApplicationController


  def create
    shipping = Shipping.new(shipping_params)
    shipping.save
    redirect_to shippings_path
  end

  def index
    @shippings = Shipping.all
    @shipping = current_customer
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private
  def shipping_params
    params.permit(:post_code, :address, :name)
  end

end
