class AddFks < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :users, foreign_key: true
    add_reference :likes, :posts, foreign_key: true
    add_reference :posts, :users, foreign_key: true
    add_reference :comments, :users, foreign_key: true
    add_reference :comments, :posts, foreign_key: true
  end
end
