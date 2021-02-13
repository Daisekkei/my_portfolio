class RemoveProjectIdFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :project_id, :string
  end
end
