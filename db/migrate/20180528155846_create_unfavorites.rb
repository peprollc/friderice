class CreateUnfavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :unfavorites do |t|
      t.integer :shop_id
      t.integer :user_id

      t.timestamps
    end
  end
end
