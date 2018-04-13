class AddstepIdToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :step_id, :integer
  end
end
