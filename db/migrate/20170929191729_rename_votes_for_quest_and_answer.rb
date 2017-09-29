class RenameVotesForQuestAndAnswer < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions, :votes, :votes_num
    rename_column :answers, :votes, :votes_num
  end
end
