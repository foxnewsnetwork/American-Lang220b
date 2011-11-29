class DeviseCreateCorporations < ActiveRecord::Migration
  def self.up
    create_table(:corporations) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :corporations, :email,                :unique => true
    add_index :corporations, :reset_password_token, :unique => true
    # add_index :corporations, :confirmation_token,   :unique => true
    # add_index :corporations, :unlock_token,         :unique => true
    # add_index :corporations, :authentication_token, :unique => true
  end

  def self.down
    drop_table :corporations
  end
end
