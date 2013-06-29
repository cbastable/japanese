class CreateWordKanjis < ActiveRecord::Migration
  def change
    create_table :word_kanjis do |t|
      t.integer :kanji_id
      t.integer :word_id

      t.timestamps
    end
       add_index :word_kanjis, :kanji_id
    add_index :word_kanjis, :word_id
    add_index :word_kanjis, [:kanji_id, :word_id], unique: true
  end
end