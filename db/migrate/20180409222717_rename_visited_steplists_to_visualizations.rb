class RenameVisitedSteplistsToVisualizations < ActiveRecord::Migration[5.1]
  def change
    rename_table :visited_steplists, :visualizations
  end
end
