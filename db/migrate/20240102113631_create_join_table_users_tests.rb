class CreateJoinTableUsersTests < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :tests do |t|
      # t.index [:user_id, :test_id]
      # t.index [:test_id, :user_id]
    end
  end
end
