class RenameVideoIdToImpressionableIdInImpressions < ActiveRecord::Migration
  def change
    rename_column :impressions, :video_id, :impressionable_id
  end
end
