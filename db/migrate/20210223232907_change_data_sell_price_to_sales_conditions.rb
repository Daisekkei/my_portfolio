class ChangeDataSellPriceToSalesConditions < ActiveRecord::Migration[5.2]
  def change
    change_column :sales_conditions, :quantity_month, :decimal
  end
end
