class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :validated, default: false
      t.text :code
      t.integer :votes, default: 0
      t.integer :views, default: 0
      t.belongs_to :question, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
