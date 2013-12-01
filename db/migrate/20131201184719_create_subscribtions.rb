class CreateSubscribtions < ActiveRecord::Migration
  def change
    create_table :subscribtions do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.timestamps
    end
  end
end
