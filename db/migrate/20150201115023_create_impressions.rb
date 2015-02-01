class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.references :video, index: true
      t.references :user, index: true
      t.string :type

      t.timestamps null: false
    end
    add_foreign_key :impressions, :videos
    add_foreign_key :impressions, :users
    add_index :impressions, :type
    add_index :impressions, [:user_id, :video_id], unique: true
  end
end
