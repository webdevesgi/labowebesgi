class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.text :description
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end
end
