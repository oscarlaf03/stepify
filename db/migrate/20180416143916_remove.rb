class Remove < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :organization_id
  end
end
