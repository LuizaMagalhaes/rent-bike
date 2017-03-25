class RemoveRentDateFromRent < ActiveRecord::Migration[5.0]
  def change
    remove_column :rents, :rent_date, :string
  end
end
