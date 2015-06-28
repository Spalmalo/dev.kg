class AddUniquenessIndexOnImpressions < ActiveRecord::Migration
  def change
    add_index :impressions, [:user_id, :impressionable_type, :impressionable_id], unique: true, name: :uniqueness_index
  end
end
