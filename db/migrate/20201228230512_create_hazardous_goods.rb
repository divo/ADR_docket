class CreateHazardousGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :hazardous_goods do |t|
      t.string :name
      t.integer :un_number
      t.string :primary_class
      t.string :secondary_class
      t.string :packing_group
      t.string :tunnel_code

      t.timestamps
    end
  end
end
