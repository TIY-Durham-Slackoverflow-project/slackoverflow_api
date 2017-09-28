class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :password_digest, null: false
      t.string :avatar
      t.text :bio_text
      t.integer :questions_asked_num
      t.integer :questions_answered_num
      t.string :token, unique: true
      t.index ["username"], name: "index_users_on_username", unique: true
      t.index ["token"], name: "index_users_on_token", unique: true

      t.timestamps
    end
  end
end
