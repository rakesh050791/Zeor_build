class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :company_name
      t.string :address_1
      t.string :address_2
      t.string :password
      t.integer :phone
      t.boolean :gender
      t.integer :age

      t.timestamps
    end
  end
end
