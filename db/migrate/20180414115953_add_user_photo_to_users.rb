class AddUserPhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_photo, :string
  end
end
