class AddIndexToSubscribtions < ActiveRecord::Migration
  def change
    add_index :subscribtions, :event_id
    add_index :subscribtions, :user_id
  end
end
