class CreateArticlesTable < ActiveRecord::Migration
  def change
    create_table :articles_tables do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
