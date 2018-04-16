class AddOrganizationIdToSteplists < ActiveRecord::Migration[5.1]
  def change
    add_column :steplists, :organization_id, :integer
  end
end
