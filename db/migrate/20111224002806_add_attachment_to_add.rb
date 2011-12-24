class AddAttachmentToAdd < ActiveRecord::Migration
  def self.up
    add_column :ads, :photo_file_name, :string
    add_column :ads, :photo_content_type, :string
    add_column :ads, :photo_file_size, :integer
    add_column :ads, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :ads, :photo_file_name, :string
    remove_column :ads, :photo_content_type, :string
    remove_column :ads, :photo_file_size, :integer
    remove_column :ads, :photo_updated_at, :datetime
  end
end
