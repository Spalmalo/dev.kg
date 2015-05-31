class AddImpressionsCountersToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :likes_count, :integer, default: 0
    add_column :videos, :dislikes_count, :integer, default: 0
  end

  # def migrate direction
  #   super

  #   if direction == :up
  #     Video.find_each do |video|
  #       Video.reset_counters video.id, :likes
  #       Video.reset_counters video.id, :dislikes
  #     end
  #   end
  # end
end
