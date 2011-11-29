class AddNameToCorporations < ActiveRecord::Migration
  def self.up
    add_column :corporations, :name, :string
    add_index :corporations, :name
  end

  def self.down
    remove_index :corporations, :name
    remove_column :corporations, :name
  end
end
