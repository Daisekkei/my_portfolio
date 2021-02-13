class AddCustomerIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :cusotmer_id, :integer
  end
end
