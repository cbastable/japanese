class AddUserIdToCustomCollections < ActiveRecord::Migration
  def change
    add_column :custom_collections, :user_id, :integer
  end
end
