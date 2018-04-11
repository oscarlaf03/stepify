class AddViewsToVisualizations < ActiveRecord::Migration[5.1]
  def change
    add_column :visualizations, :views, :integer , default: 0
  end
end
