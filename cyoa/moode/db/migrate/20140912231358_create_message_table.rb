class CreateMessageTable < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :type
      t.decimal :ts
      t.text :text
      t.float :score
      t.integer :user_id
      t.integer :channel_id
      t.integer :time_id

      t.timestamps
    end
  end
end
