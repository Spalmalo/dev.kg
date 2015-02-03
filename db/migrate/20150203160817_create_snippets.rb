class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.references :video, index: true
      t.string :file
      t.integer :language
      t.text :code

      t.timestamps null: false
    end
    add_foreign_key :snippets, :videos
  end
end
