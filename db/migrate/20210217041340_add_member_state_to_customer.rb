class AddMemberStateToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :member_state, :boolean
  end
end
