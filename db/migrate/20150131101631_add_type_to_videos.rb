class AddTypeToVideos < ActiveRecord::Migration
  def change
    add_column  :videos, :type, :string
    add_index   :videos, :type
  end

  # def migrate direction
  #   super
  #   Video.update_all type: 'Screencast' if direction == :up
  # end
end
