class AddOrganizationIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :organization_id, :integer
  end
end
