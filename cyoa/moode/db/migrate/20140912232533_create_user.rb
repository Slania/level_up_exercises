class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :slack_id
      t.string :real_name
      t.string :email
      t.text :avatar_url

      t.timestamps
    end
  end
end
