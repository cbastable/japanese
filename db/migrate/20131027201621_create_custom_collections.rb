class CreateCustomCollections < ActiveRecord::Migration
  def change
    create_table :custom_collections do |t|
      t.string :name

      t.timestamps
    end
    add_index :custom_collections, :name
  end
end
