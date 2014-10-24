class CreateStagingTable < ActiveRecord::Migration
  def change
    create_table :staging do |t|
      t.string :type
      t.decimal :ts
      t.text :text
      t.float :score
      t.integer :user_id
      t.integer :channel_id
      t.timestamp :timestamp
    end
  end
end
