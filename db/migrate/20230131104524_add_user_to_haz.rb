class AddUserToHaz < ActiveRecord::Migration[5.2]
  def change
    add_column :hazardous_goods, :user_id, :integer
    add_index :hazardous_goods, :user_id
  end
end
