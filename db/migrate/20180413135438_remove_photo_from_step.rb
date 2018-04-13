class RemovePhotoFromStep < ActiveRecord::Migration[5.1]
  def change
    remove_column :steps, :photo
  end
end
