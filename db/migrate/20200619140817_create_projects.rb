class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :vendor_name
      t.string :board_name
      t.integer :project_id

      t.timestamps
    end
  end
end
