class Customer::HomesController < ApplicationController
  
  def top
    @item = Item.limit(4).order(" created_at DESC ")
  end
end
