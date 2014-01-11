class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.text :description

      t.timestamps
    end
  end
end
