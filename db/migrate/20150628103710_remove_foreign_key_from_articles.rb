class RemoveForeignKeyFromArticles < ActiveRecord::Migration
  def change
    remove_foreign_key :articles, column: "parent_id"
  end
end
