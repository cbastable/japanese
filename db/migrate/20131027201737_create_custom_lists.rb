class CreateCustomLists < ActiveRecord::Migration
  def change
    create_table :custom_lists do |t|
      t.integer :kanji_id
      t.integer :custom_collection_id

      t.timestamps
    end
    add_index :custom_lists, :kanji_id
    add_index :custom_lists, :custom_collection_id
    add_index :custom_lists, [:kanji_id, :custom_collection_id], unique: true
  end
end
