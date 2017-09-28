class DefaultVotesViewsToZero < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :votes, :integer, default: 0
    change_column :questions, :views, :integer, default: 0
  end
end
