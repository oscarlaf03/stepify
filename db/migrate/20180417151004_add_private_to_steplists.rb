class AddPrivateToSteplists < ActiveRecord::Migration[5.1]
  def change
    add_column :steplists, :private, :boolean, null: false, default: false
  end
end
