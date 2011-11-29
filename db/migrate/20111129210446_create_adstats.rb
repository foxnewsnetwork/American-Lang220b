class CreateAdstats < ActiveRecord::Migration
  def self.up
    create_table :adstats do |t|
      t.integer :user_id
      t.integer :ad_id
      t.integer :views
      t.integer :clicks
      t.integer :closes

      t.timestamps
    end
  end

  def self.down
    drop_table :adstats
  end
end
