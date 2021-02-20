class RemoveVendorNameFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :vendor_name, :string
  end
end
