class UpdateStatusColumn2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :trips, :string, :status
  end
end
