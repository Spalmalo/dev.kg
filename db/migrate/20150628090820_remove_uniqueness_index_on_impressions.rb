class RemoveUniquenessIndexOnImpressions < ActiveRecord::Migration
  def change
    remove_index :impressions, [:user_id, :impressionable_id]
  end
end
