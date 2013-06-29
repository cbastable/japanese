class CreateWordCollections < ActiveRecord::Migration
  def change
    create_table :word_collections do |t|
      t.integer :collection_id
      t.integer :word_id

      t.timestamps
    end
    add_index :word_collections, :word_id
    add_index :word_collections, :collection_id
    add_index :word_collections, [:word_id, :collection_id], unique: true
  end
end