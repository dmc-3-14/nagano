class Customer::ShippingsController < ApplicationController


  def create
    @shippings = Shipping.all
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      flash[:notice] = "Shipping was successfully created"
      redirect_to shippings_path
    else
      render 'index'
    end
  end

  def index
    @shippings = Shipping.all
    @shipping = Shipping.new
    @shipping.customer_id = current_customer.id
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    shipping = Shipping.find(params[:id])
    if shipping.update(shipping_params)
      flash[:notice] = "You have updated shipping successfully."
      redirect_to customers_path
    else
      render 'index'
    end
  end

  def destroy
    shipping = Shipping.find(params[:id])
    shipping.destroy
    redirect_to shippings_path
  end

  private
  def shipping_params
    params.require(:shipping).permit(:post_code, :address, :name)
  end

end
