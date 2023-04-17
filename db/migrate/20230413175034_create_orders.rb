class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :start_destination
      t.string :final_destination
      t.integer :quantity
      t.string :goods_type
      t.text :additional_details
      


      t.timestamps
    end
  end
end
