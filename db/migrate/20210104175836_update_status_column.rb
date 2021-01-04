class UpdateStatusColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :trips, :string, :status
  end
end
