class AddImpressionsCountersToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes_count, :integer, default: 0
    add_column :posts, :dislikes_count, :integer, default: 0
  end
end
