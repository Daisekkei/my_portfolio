class RenameTitleColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :title, :position
  end
end
