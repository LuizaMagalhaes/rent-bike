class AddAdvertisementRefToBike < ActiveRecord::Migration[5.0]
  def change
    add_reference :bikes, :advertisement, foreign_key: true
  end
end
