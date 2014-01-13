class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :sub_category_id
      t.string :title
      t.string :item_type
      t.string :amount
      t.text :description

      t.timestamps
    end
  end
end
