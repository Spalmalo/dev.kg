class AddUniqueIndexOnVideoUrlInVideos < ActiveRecord::Migration
  def change
    add_index :videos, :video_url, unique: true
  end
end
