class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :title
      t.integer :non_tax_price
      t.boolean :sale_state
      t.string :image_id
      t.string :body

      t.timestamps
    end
  end
end
