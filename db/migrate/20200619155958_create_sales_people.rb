class CreateSalesPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_people do |t|
      t.string :sales_name
      t.integer :custommer_id

      t.timestamps
    end
  end
end
