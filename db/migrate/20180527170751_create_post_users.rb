class CreatePostUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :post_users do |t|
      t.integer :user_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
