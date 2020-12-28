class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :address
      t.float :lat
      t.float :long
      t.string :eircode

      t.timestamps
    end
  end
end
