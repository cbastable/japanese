class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :kanji_id
      t.integer :collection_id

      t.timestamps
    end
    add_index :lists, :kanji_id
    add_index :lists, :collection_id
    add_index :lists, [:kanji_id, :collection_id], unique: true
  end
end
