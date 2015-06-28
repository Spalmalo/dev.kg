class AddTypeToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :type, :string
  end

  def migrate direction
    super

    if direction == :up
      ActiveRecord::Base.connection.execute("UPDATE \"articles\" SET \"type\" = 'Asciicast'")
    end
  end
end
