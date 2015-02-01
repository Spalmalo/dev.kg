class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.references :video, index: true
      t.string :title
      t.text :url

      t.timestamps null: false
    end
    add_foreign_key :references, :videos
  end
end
