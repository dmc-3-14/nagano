class ChangeMemberStateCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :customers, :member_state, :true
  end
end
