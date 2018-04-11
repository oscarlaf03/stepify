class RemoveSteplistFromVisualizations < ActiveRecord::Migration[5.1]
  def change
    remove_column :visualizations, :steplist_id
  end
end
