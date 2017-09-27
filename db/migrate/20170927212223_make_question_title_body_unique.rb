class MakeQuestionTitleBodyUnique < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :title, :string, null: false
    change_column :questions, :body, :text, null: false
  end
end
