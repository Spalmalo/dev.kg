class DropSpeakers < ActiveRecord::Migration
  def change
    drop_table :speakers
  end
end
