class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.float :temp
      t.string :type
      t.boolean :rings
      t.boolean :fauna
      t.boolean :flora
      t.boolean :daytime
      t.boolean :landable
      t.boolean :visited
      t.float :gravity_level

      t.timestamps
    end
  end
end
