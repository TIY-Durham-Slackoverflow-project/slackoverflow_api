class AddBigPictureToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar_big, :string
  end
end
