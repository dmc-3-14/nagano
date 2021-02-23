class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
   @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to admin_customer_path(@customer.id)
   else
     render :edit
   end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name, :kana_last_name, :kana_first_name, :post_code, :address, :telephone_number,:telephone_number, :email, :member_state)
  end

end