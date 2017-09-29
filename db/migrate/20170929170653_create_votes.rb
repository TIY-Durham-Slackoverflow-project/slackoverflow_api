class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :value
      t.belongs_to :user, foreign_key: true
      t.belongs_to :question, foreign_key: true
      t.belongs_to :answer, foreign_key: true

      t.timestamps
    end

    add_index :votes, [:question_id, :user_id], unique: true
    add_index :votes, [:answer_id, :user_id], unique: true
  end
end
