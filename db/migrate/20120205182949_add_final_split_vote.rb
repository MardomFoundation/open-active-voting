class AddFinalSplitVote < ActiveRecord::Migration
  def up
    create_table :final_split_votes do |t|
      t.integer :neighborhood_id, :null=>false
      t.text :payload_data, :null=>false
      t.integer :vote_id, :null=>false
      t.timestamps
    end

    add_index :final_split_votes, :neighborhood_id
  end

  def down
  end
end