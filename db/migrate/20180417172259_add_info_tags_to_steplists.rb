class AddInfoTagsToSteplists < ActiveRecord::Migration[5.1]
  def change
    add_column :steplists, :info_tag, :text
  end
end
