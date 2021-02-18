class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(current_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to customers_path
    else
     render("customer/edit")
    end
  end

  def exit
    @customer = current_customer
  end

  def stateupdate
     @customer = Customer.find(current_customer.id)
    #現在ログインしているユーザーを@userに格納
    @customer.update(is_active: "Invalid")
    #updateで登録情報をInvalidに変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
  end

  private

def customer_params
    params.require(:customer).permit(:active)
end

end
