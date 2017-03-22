class AddOwnerToAdvertisement < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :owner, :string
  end
end
