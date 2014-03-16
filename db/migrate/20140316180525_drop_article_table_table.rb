class DropArticleTableTable < ActiveRecord::Migration
  def change
    drop_table :articles_tables
  end
end
