class CreateVotecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :votecomments do |t|
      t.references :user
      t.references :comment
      t.boolean :upvote
      t.timestamps
    end
  end
end

