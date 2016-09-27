class AddUserIdToFlyer < ActiveRecord::Migration
  def change
    add_column :flyers, :user_id, :integer
  end
end
