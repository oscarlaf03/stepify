class AddStepToVisualizations < ActiveRecord::Migration[5.1]
  def change
    add_reference :visualizations, :step, foreign_key: true
  end
end
