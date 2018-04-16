class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :company_name
      t.string :web_site
      t.string :logo
      t.string :image_banner

      t.timestamps
    end
  end
end
