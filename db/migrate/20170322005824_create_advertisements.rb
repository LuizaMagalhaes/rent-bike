class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :address
      t.decimal :price

      t.timestamps
    end
  end
end
