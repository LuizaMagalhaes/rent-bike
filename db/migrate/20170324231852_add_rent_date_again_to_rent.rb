class AddRentDateAgainToRent < ActiveRecord::Migration[5.0]
  def change
    add_column :rents, :rent_date, :date
  end
end
