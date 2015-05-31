class AddContentHtmlToAsciicasts < ActiveRecord::Migration
  def change
    add_column :asciicasts, :content_html, :text
  end
end
