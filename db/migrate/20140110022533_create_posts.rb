class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:title]
    add_index :posts, [:permalink]
    add_index :posts, [:created_at]
    add_index :posts, [:title, :created_at]
    add_index :posts, [:user_id, :created_at]
  end
end
