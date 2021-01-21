class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.text :tagline
      t.string :phone
      t.string :fax
      t.string :email
      t.references :address, foreign_key: true
      t.references :dockets, foreign_key: true

      t.timestamps
    end
  end
end
