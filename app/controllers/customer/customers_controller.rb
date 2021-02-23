class Customer::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to customers_path
    else
     render :edit
    end
  end

  def exit
    @customer = current_customer
  end

  def hide
    @customer = current_customer
    @customer.update(member_state: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end


  def active_for_authentication?
    super && (self.member_state == false)
  end

  private

def customer_params
    params.require(:customer).permit(:last_name,:first_name, :kana_last_name, :kana_first_name, :post_code, :address, :telephone_number,:telephone_number, :email)
end

end