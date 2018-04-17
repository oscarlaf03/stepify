class ChangeColumFormatSteplistsToText < ActiveRecord::Migration[5.1]
  def change
    change_column :steplists, :user_tags, :text
  end
end
