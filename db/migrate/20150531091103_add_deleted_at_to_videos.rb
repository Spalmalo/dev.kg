class AddDeletedAtToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :deleted_at, :datetime
    add_index :videos, :deleted_at
  end
end
