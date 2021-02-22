class ChangeIsStateDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :state, :"入金待ち"
  end
end
