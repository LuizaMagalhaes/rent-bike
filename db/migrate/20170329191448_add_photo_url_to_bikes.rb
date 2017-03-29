class AddPhotoUrlToBikes < ActiveRecord::Migration[5.0]
  def change
    add_column :bikes, :photo_url, :string
  end
end
