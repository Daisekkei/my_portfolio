class AddColumnToSalesConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :sales_conditions, :vendor, :string
  end
end
