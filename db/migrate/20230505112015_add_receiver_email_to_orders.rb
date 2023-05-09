class AddReceiverEmailToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :receiver_email, :string
  end
end
