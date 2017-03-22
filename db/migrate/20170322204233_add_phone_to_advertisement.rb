class AddPhoneToAdvertisement < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :phone, :string
  end
end
