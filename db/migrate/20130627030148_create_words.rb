class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :reading
      t.string :translation

      t.timestamps
    end
    add_index :words, :word
    add_index :words, :reading
    add_index :words, :translation
  end
end
