class CreateScreencasts < ActiveRecord::Migration
  def change
    create_table :screencasts do |t|
      t.string :title
      t.text :description
      t.string :video_url

      t.timestamps null: false
    end
  end
end
