class RemoveForeignKeyFromVideos < ActiveRecord::Migration
  def change
    remove_foreign_key :impressions, column: :impressionable_id
  end
end
