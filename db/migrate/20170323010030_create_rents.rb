class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.references :customer, foreign_key: true
      t.references :advertisement, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
