class ChangeColumFormatSteplists < ActiveRecord::Migration[5.1]
  def change
    change_column :steplists, :user_tags, :string
  end
end
