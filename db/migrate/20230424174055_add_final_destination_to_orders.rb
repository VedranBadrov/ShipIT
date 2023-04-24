class AddFinalDestinationToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :final_destination_address_line_1, :string
    add_column :orders, :final_destination_address_line_2, :string
    add_column :orders, :final_destination_city, :string
    add_column :orders, :final_destination_postcode, :string
  end
end
