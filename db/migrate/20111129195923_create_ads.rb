class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.text :content
      t.integer :corporation_id

      t.timestamps
    end
    
    add_index :ads, :corporation_id
  end

  def self.down
    drop_table :ads
  end
end
