class AddPasswordResetCreatedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_created_at, :datetime
  end
end
