class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :color
      t.string :weel_size
      t.string :condition
      t.string :category
      t.string :use_for

      t.timestamps
    end
  end
end
