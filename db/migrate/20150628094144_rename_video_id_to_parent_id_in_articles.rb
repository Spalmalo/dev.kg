class RenameVideoIdToParentIdInArticles < ActiveRecord::Migration
  def change
    rename_column :articles, :video_id, :parent_id
  end
end
