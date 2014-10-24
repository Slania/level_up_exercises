class RemoveIdFromStaging < ActiveRecord::Migration
  def change
    remove_column :staging, :id
  end
end
