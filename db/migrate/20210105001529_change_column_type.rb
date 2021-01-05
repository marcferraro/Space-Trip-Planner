class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :type, :category
  end
end
