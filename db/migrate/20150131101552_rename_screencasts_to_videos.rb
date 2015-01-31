class RenameScreencastsToVideos < ActiveRecord::Migration
  def change
    rename_table :screencasts, :videos
  end
end
