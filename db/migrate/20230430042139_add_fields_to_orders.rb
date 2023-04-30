class AddFieldsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :weight, :float
    add_column :orders, :distance, :float
  end
end
