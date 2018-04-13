class DropPhotos < ActiveRecord::Migration[5.1]
  def change
    drop_table :photos
  end
end
