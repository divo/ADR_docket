class AddBerthToDocket < ActiveRecord::Migration[5.2]
  def change
    add_column :dockets, :berth, :string
  end
end
