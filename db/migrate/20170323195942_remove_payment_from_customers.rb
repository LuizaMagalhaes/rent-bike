class RemovePaymentFromCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :payment, :string
  end
end
