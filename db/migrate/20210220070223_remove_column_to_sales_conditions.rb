class RemoveColumnToSalesConditions < ActiveRecord::Migration[5.2]
  def change
    remove_column :sales_conditions, :update, :timestamp
  end
end
