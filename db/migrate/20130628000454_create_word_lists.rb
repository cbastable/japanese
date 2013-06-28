class CreateWordLists < ActiveRecord::Migration
  def change
    create_table :word_lists do |t|
      t.integer :kanji_id
      t.integer :word_id

      t.timestamps
    end
       add_index :word_lists, :kanji_id
    add_index :word_lists, :word_id
    add_index :word_lists, [:kanji_id, :word_id], unique: true
  end
end