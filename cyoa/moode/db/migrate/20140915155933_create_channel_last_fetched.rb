class CreateChannelLastFetched < ActiveRecord::Migration
  def change
    create_table(:channel_last_fetched, :id => false) do |t|
      t.integer :channel_id
      t.decimal :latest_ts
      t.decimal :oldest_ts

      t.timestamps
    end
  end
end
