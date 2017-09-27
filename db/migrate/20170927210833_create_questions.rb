class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :votes, default: 0
      t.integer :views, default: 0
      t.integer :answers_num, default: 0
      t.text :tags
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
