class CreateDockets < ActiveRecord::Migration[5.2]
  def change
    create_table :dockets do |t|
      t.string :equipment_no
      t.string :customer_reference_no
      t.string :seal_no
      t.text :description
      t.boolean :return_empty
      t.references :deliver_to
      t.references :collect_from
      t.references :hazardous_good, foreign_key: true

      t.timestamps
    end
  end
end
