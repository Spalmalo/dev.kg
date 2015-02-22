class AddPublishedAtToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :published_at, :datetime
  end
end
