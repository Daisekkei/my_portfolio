class CreateSalesConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_conditions do |t|
      t.integer :project_id
      t.string :part_number
      t.date :Prot
      t.date :MP
      t.decimal :sell_price
      t.decimal :buy_price
      t.integer :quantity_month
      t.string :MP_site
      t.timestamp :update

      t.timestamps
    end
  end
end
