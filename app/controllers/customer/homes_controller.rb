class Customer::HomesController < ApplicationController

  def top
    @item = Item.where(sale_state: "true").limit(4).order(" created_at DESC ")
  end
end
