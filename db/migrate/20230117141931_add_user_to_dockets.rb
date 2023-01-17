class AddUserToDockets < ActiveRecord::Migration[5.2]
  def change
    add_column :dockets, :user_id, :integer
    add_index :dockets, :user_id
  end
end
