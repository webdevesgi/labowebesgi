class AddIndexToTalks < ActiveRecord::Migration
  def change
    add_index :talks, :event_id
    add_index :talks, :user_id
  end
end
