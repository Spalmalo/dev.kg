class RenameAsciicastsIntoArticles < ActiveRecord::Migration
  def change
    rename_table :asciicasts, :articles
  end

end
