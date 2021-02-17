class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = customer.find(params[:id])
    if @customer.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to customer_path(@customer.id)
    else
     render("customer/edit")
    end
  end

  def exit
  end
end
