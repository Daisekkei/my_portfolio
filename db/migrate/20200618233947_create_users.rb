class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :userID
      t.string :user_name
      t.string :email
      t.string :password
      t.string :department

      t.timestamps
    end
  end
end
