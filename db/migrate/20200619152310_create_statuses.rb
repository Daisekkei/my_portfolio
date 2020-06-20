class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.text :report
      t.blob :attachment
      t.integer :project_id

      t.timestamps
    end
  end
end
