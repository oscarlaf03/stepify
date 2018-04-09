class CreateVisitedSteplists < ActiveRecord::Migration[5.1]
  def change
    create_table :visited_steplists do |t|
      t.integer :last_step
      t.references :user, foreign_key: true
      t.references :steplist, foreign_key: true

      t.timestamps
    end
  end
end
