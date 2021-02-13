class RenameCusotmerIdToProjects < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :cusotmer_id, :customer_id
  end
end
