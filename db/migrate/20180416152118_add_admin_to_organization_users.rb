class AddAdminToOrganizationUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :organization_users, :admin, :boolean, null: false, default: false
  end
end
