class CreateShopImages < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_images do |t|
      t.integer :shop_id
      t.text :image

      t.timestamps
    end
  end
end
