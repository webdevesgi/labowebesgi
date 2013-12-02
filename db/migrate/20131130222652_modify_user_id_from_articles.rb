class ModifyUserIdFromArticles < ActiveRecord::Migration
  def change
    change_column :articles, :user_id, 'integer USING CAST(column_to_change AS integer)'
  end
end
