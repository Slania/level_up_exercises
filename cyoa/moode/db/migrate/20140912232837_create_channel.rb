class CreateChannel < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :slack_id
      t.string :name

      t.timestamps
    end
  end
end
