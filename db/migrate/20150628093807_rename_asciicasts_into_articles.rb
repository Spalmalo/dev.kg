class RenameAsciicastsIntoArticles < ActiveRecord::Migration
  def change
    rename_table :asciicasts, :articles
  end

  def migrate direction
    super

    if direction == :up
      ActiveRecord::Base.connection.execute("UPDATE \"articles\" SET \"type\" = 'Asciicast'")
    end
  end
end
