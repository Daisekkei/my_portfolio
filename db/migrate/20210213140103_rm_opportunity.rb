class RmOpportunity < ActiveRecord::Migration[5.2]
  def change
    drop_table :opportunities
  end
end
