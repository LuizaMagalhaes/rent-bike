class AddPaymentToRent < ActiveRecord::Migration[5.0]
  def change
    add_column :rents, :payment, :string
  end
end
