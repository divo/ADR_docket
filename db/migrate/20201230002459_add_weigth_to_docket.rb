class AddWeigthToDocket < ActiveRecord::Migration[5.2]
  def change
    add_column :dockets, :weight, :string
  end
end
