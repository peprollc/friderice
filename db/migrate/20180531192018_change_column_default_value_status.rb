class ChangeColumnDefaultValueStatus < ActiveRecord::Migration[5.1]
  def change
    change_column :shops, :status, :integer, default: 1
  end
end
