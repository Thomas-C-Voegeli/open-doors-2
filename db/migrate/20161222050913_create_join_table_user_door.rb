class CreateJoinTableUserDoor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :doors do |t|
      # t.index [:user_id, :door_id]
      # t.index [:door_id, :user_id]
    end
  end
end
