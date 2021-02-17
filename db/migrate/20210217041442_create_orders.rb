class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :fee
      t.integer :billing_amount
      t.integer :payment_method
      t.integer :state

      t.timestamps
    end
  end
end
