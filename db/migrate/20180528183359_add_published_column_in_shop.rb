class AddPublishedColumnInShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :status, :integer, default: 0
  end
end
