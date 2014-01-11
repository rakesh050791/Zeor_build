class CreatePrivacies < ActiveRecord::Migration
  def change
    create_table :privacies do |t|
      t.text :description

      t.timestamps
    end
  end
end
