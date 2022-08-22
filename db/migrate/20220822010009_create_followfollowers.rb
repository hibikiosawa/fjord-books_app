class CreateFollowfollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followfollowers do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :followfollowers, [:follower_id, :followed_id], unique: true
  end
end
