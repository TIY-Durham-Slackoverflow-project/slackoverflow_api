class UserQuestAskAnswDefaultToZero < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :questions_asked_num, :integer, default: 0
    change_column :users, :questions_answered_num, :integer, default: 0
  end
end
