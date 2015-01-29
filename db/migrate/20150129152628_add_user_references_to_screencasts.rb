class AddUserReferencesToScreencasts < ActiveRecord::Migration
  def change
    add_reference :screencasts, :user, index: true
    add_foreign_key :screencasts, :users
  end
end
