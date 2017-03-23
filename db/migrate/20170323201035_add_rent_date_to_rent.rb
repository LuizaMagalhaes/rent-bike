class AddRentDateToRent < ActiveRecord::Migration[5.0]
  def change
    add_column :rents, :rent_date, :string
  end
end
