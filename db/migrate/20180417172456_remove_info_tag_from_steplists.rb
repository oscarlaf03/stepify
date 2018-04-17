class RemoveInfoTagFromSteplists < ActiveRecord::Migration[5.1]
  def change
    remove_column :steplists, :info_tag
  end
end
