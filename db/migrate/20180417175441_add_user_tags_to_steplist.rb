class AddUserTagsToSteplist < ActiveRecord::Migration[5.1]
  def change
    add_column :steplists, :user_tags, :json
  end
end
