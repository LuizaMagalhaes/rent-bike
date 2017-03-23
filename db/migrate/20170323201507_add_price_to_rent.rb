class AddPriceToRent < ActiveRecord::Migration[5.0]
  def change
    add_column :rents, :price, :decimal
  end
end
