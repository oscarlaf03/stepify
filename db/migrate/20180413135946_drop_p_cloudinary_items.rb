class DropPCloudinaryItems < ActiveRecord::Migration[5.1]
  def change
    drop_table :cloudinary_items
  end
end
