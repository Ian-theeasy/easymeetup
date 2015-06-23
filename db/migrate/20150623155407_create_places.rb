class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :owner
      t.string :address
      t.integer :capacity
      t.text :description

      t.timestamps
    end
  end
end
