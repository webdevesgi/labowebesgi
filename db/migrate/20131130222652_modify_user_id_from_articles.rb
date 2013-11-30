class ModifyUserIdFromArticles < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.change :user_id, :integer
    end
  end
end
