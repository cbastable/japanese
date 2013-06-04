class CreateKanjis < ActiveRecord::Migration
  def change
    create_table :kanjis do |t|
      t.string :kanji
      t.string :onyomi
      t.string :kunyomi
      t.string :english

      t.timestamps
    end
    #add_index :kanjis, :kanji
  end
end
