class CreateAsciicasts < ActiveRecord::Migration
  def change
    create_table :asciicasts do |t|
      t.references :video, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :asciicasts, :videos
  end
end
