class AddSizeToDocket < ActiveRecord::Migration[5.2]
  def change
    add_column :dockets, :size, :string
  end
end
