class AddImpressionableTypeToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :impressionable_type, :string
  end

  def migrate direction
    super

    if direction == :up
      ActiveRecord::Base.connection.execute("UPDATE \"impressions\" SET \"impressionable_type\" = 'Video'")
    end
  end
end
