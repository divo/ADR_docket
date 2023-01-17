class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :company_name
      t.string :tagline
      t.string :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
