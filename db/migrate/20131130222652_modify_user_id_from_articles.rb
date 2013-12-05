class ModifyUserIdFromArticles < ActiveRecord::Migration
  def change
    change_column :articles, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
