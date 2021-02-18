class ChangeSaleStateOnItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :sale_state, :true
  end
end
