class AddConfirmationTokenSentAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token_sent_at, :datetime
  end
end
