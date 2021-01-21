class AddAccountToDockets < ActiveRecord::Migration[5.2]
  def change
    add_column :dockets, :account_id, :bigint
    add_index :dockets, :account_id
  end
end
