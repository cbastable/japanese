class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :word
      t.text :reading
      t.text :translation

      t.timestamps
    end
    add_index :words, :word
    add_index :words, :reading
    add_index :words, :translation
  end
end
