class AddPublishedColumnInShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :status, :boolean, default: true
  end
end
