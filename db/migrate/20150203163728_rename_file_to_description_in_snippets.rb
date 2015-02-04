class RenameFileToDescriptionInSnippets < ActiveRecord::Migration
  def change
    rename_column :snippets, :file, :description
  end
end
