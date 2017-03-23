class RemovePriceFromRents < ActiveRecord::Migration[5.0]
  def change
    remove_column :rents, :price, :decimal
  end
end
