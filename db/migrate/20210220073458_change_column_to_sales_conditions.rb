class ChangeColumnToSalesConditions < ActiveRecord::Migration[5.2]
  def change
    rename_column :sales_conditions, :MP, :mp_date
    rename_column :sales_conditions, :MP_site, :mp_site
    rename_column :sales_conditions, :Prot, :prot_date
  end
end
